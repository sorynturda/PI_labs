// OpenCVApplication.cpp : Ubuntu version
//

#include <opencv2/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/core/utils/logger.hpp>
#include <string>
#include <vector>
#include <iostream>
#include <dirent.h>
#include <unistd.h>
#include <sys/stat.h>

std::string projectPath;

using namespace cv;
using namespace std;

// Function to open file dialog and get filename
bool openFileDlg(std::string &filename) {
    filename = "";
    const char *cmd = "zenity --file-selection --title=\"Select an image file\" 2>/dev/null";
    FILE *pipe = popen(cmd, "r");
    if (!pipe) return false;

    char buffer[1024];
    if (fgets(buffer, sizeof(buffer), pipe) != NULL) {
        filename = buffer;
        if (!filename.empty() && filename[filename.length() - 1] == '\n') {
            filename.erase(filename.length() - 1);
        }
    }
    pclose(pipe);
    return !filename.empty();
}

// Function to open folder dialog and get folder name
bool openFolderDlg(std::string &folderName) {
    folderName = "";
    const char *cmd = "zenity --file-selection --directory --title=\"Select a folder\" 2>/dev/null";
    FILE *pipe = popen(cmd, "r");
    if (!pipe) return false;

    char buffer[1024];
    if (fgets(buffer, sizeof(buffer), pipe) != NULL) {
        folderName = buffer;
        // Remove newline character if present
        if (!folderName.empty() && folderName[folderName.length() - 1] == '\n') {
            folderName.erase(folderName.length() - 1);
        }
    }
    pclose(pipe);
    return !folderName.empty();
}

// FileGetter class to iterate through files in a directory
class FileGetter {
private:
    DIR *dir;
    std::string folderPath;
    std::string extension;
    std::string currentFile;

public:
    FileGetter(const std::string &folderPath, const std::string &ext)
        : folderPath(folderPath), extension(ext) {
        dir = opendir(folderPath.c_str());
    }

    ~FileGetter() {
        if (dir) closedir(dir);
    }

    bool getNextAbsFile(std::string &filePath) {
        if (!dir) return false;

        struct dirent *entry;
        while ((entry = readdir(dir)) != NULL) {
            std::string fname = entry->d_name;

            // Check if file has the specified extension
            size_t pos = fname.rfind(".");
            if (pos != std::string::npos) {
                std::string fileExt = fname.substr(pos + 1);
                if (fileExt == extension) {
                    currentFile = fname;
                    filePath = folderPath + "/" + fname;
                    return true;
                }
            }
        }
        return false;
    }

    std::string getFoundFileName() {
        return currentFile;
    }
};

// Function to resize an image
void resizeImg(const Mat &src, Mat &dst, int maxSize, bool interpolate) {
    double ratio = 1;
    int width = src.cols;
    int height = src.rows;

    if (width > height) {
        ratio = (double) maxSize / width;
    } else {
        ratio = (double) maxSize / height;
    }

    int newWidth = (int) (width * ratio);
    int newHeight = (int) (height * ratio);

    if (interpolate) {
        resize(src, dst, Size(newWidth, newHeight), 0, 0, INTER_LINEAR);
    } else {
        resize(src, dst, Size(newWidth, newHeight), 0, 0, INTER_NEAREST);
    }
}

void testOpenImage() {
    std::string fname;
    while (openFileDlg(fname)) {
        Mat src;
        src = imread(fname);
        imshow("image", src);
        waitKey();
    }
}

void testOpenImagesFld() {
    std::string folderName;
    if (!openFolderDlg(folderName))
        return;

    std::string fname;
    FileGetter fg(folderName, "bmp");
    while (fg.getNextAbsFile(fname)) {
        Mat src;
        src = imread(fname);
        imshow(fg.getFoundFileName(), src);
        if (waitKey() == 27) //ESC pressed
            break;
    }
}

void testImageOpenAndSave() {
    chdir(projectPath.c_str());

    Mat src, dst;

    src = imread("Images/Lena_24bits.bmp", IMREAD_COLOR); // Read the image

    if (!src.data) // Check for invalid input
    {
        printf("Could not open or find the image\n");
        return;
    }

    // Get the image resolution
    Size src_size = Size(src.cols, src.rows);

    // Display window
    const char *WIN_SRC = "Src"; //window for the source image
    namedWindow(WIN_SRC, WINDOW_AUTOSIZE);
    moveWindow(WIN_SRC, 0, 0);

    const char *WIN_DST = "Dst"; //window for the destination (processed) image
    namedWindow(WIN_DST, WINDOW_AUTOSIZE);
    moveWindow(WIN_DST, src_size.width + 10, 0);

    cvtColor(src, dst, COLOR_BGR2GRAY); //converts the source image to a grayscale one

    imwrite("Images/Lena_24bits_gray.bmp", dst); //writes the destination to file

    imshow(WIN_SRC, src);
    imshow(WIN_DST, dst);

    waitKey(0);
}

void testNegativeImage() {
    std::string fname;
    while (openFileDlg(fname)) {
        double t = (double) getTickCount(); // Get the current time [s]

        Mat src = imread(fname, IMREAD_GRAYSCALE);
        int height = src.rows;
        int width = src.cols;
        Mat dst = Mat(height, width, CV_8UC1);
        // Accessing individual pixels in an 8 bits/pixel image
        // Inefficient way -> slow
        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {
                uchar val = src.at<uchar>(i, j);
                uchar neg = 255 - val;
                dst.at<uchar>(i, j) = neg;
            }
        }

        // Get the current time again and compute the time difference [s]
        t = ((double) getTickCount() - t) / getTickFrequency();
        // Print (in the console window) the processing time in [ms]
        printf("Time = %.3f [ms]\n", t * 1000);

        imshow("input image", src);
        imshow("negative image", dst);
        waitKey();
    }
}

void testNegativeImageFast() {
    std::string fname;
    while (openFileDlg(fname)) {
        Mat src = imread(fname, IMREAD_GRAYSCALE);
        int height = src.rows;
        int width = src.cols;
        Mat dst = src.clone();

        double t = (double) getTickCount(); // Get the current time [s]

        // The fastest approach of accessing the pixels -> using pointers
        uchar *lpSrc = src.data;
        uchar *lpDst = dst.data;
        int w = (int) src.step; // no dword alignment is done !!!
        for (int i = 0; i < height; i++)
            for (int j = 0; j < width; j++) {
                uchar val = lpSrc[i * w + j];
                lpDst[i * w + j] = 255 - val;
            }

        // Get the current time again and compute the time difference [s]
        t = ((double) getTickCount() - t) / getTickFrequency();
        // Print (in the console window) the processing time in [ms]
        printf("Time = %.3f [ms]\n", t * 1000);

        imshow("input image", src);
        imshow("negative image", dst);
        waitKey();
    }
}

void testColor2Gray() {
    std::string fname;
    while (openFileDlg(fname)) {
        Mat src = imread(fname);

        int height = src.rows;
        int width = src.cols;

        Mat dst = Mat(height, width, CV_8UC1);

        // Accessing individual pixels in a RGB 24 bits/pixel image
        // Inefficient way -> slow
        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {
                Vec3b v3 = src.at<Vec3b>(i, j);
                uchar b = v3[0];
                uchar g = v3[1];
                uchar r = v3[2];
                dst.at<uchar>(i, j) = (r + g + b) / 3;
            }
        }

        imshow("input image", src);
        imshow("gray image", dst);
        waitKey();
    }
}

void testBGR2HSV() {
    std::string fname;
    while (openFileDlg(fname)) {
        Mat src = imread(fname);
        int height = src.rows;
        int width = src.cols;

        // HSV components
        Mat H = Mat(height, width, CV_8UC1);
        Mat S = Mat(height, width, CV_8UC1);
        Mat V = Mat(height, width, CV_8UC1);

        // Defining pointers to each matrix (8 bits/pixels) of the individual components H, S, V
        uchar *lpH = H.data;
        uchar *lpS = S.data;
        uchar *lpV = V.data;

        Mat hsvImg;
        cvtColor(src, hsvImg, COLOR_BGR2HSV);

        // Defining the pointer to the HSV image matrix (24 bits/pixel)
        uchar *hsvDataPtr = hsvImg.data;

        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {
                int hi = i * width * 3 + j * 3;
                int gi = i * width + j;

                lpH[gi] = hsvDataPtr[hi] * 510 / 360; // lpH = 0 .. 255
                lpS[gi] = hsvDataPtr[hi + 1]; // lpS = 0 .. 255
                lpV[gi] = hsvDataPtr[hi + 2]; // lpV = 0 .. 255
            }
        }

        imshow("input image", src);
        imshow("H", H);
        imshow("S", S);
        imshow("V", V);

        waitKey();
    }
}

void testResize() {
    std::string fname;
    while (openFileDlg(fname)) {
        Mat src;
        src = imread(fname);
        Mat dst1, dst2;
        //without interpolation
        resizeImg(src, dst1, 320, false);
        //with interpolation
        resizeImg(src, dst2, 320, true);
        imshow("input image", src);
        imshow("resized image (without interpolation)", dst1);
        imshow("resized image (with interpolation)", dst2);
        waitKey();
    }
}

void testCanny() {
    std::string fname;
    while (openFileDlg(fname)) {
        Mat src, dst, gauss;
        src = imread(fname, IMREAD_GRAYSCALE);
        double k = 0.4;
        int pH = 50;
        int pL = (int) k * pH;
        GaussianBlur(src, gauss, Size(5, 5), 0.8, 0.8);
        Canny(gauss, dst, pL, pH, 3);
        imshow("input image", src);
        imshow("canny", dst);
        waitKey();
    }
}

void testVideoSequence() {
    chdir(projectPath.c_str());

    VideoCapture cap("Videos/rubic.avi"); // off-line video from file
    //VideoCapture cap(0);    // live video from web cam
    if (!cap.isOpened()) {
        printf("Cannot open video capture device.\n");
        waitKey(0);
        return;
    }

    Mat edges;
    Mat frame;
    char c;

    while (cap.read(frame)) {
        Mat grayFrame;
        cvtColor(frame, grayFrame, COLOR_BGR2GRAY);
        Canny(grayFrame, edges, 40, 100, 3);
        imshow("source", frame);
        imshow("gray", grayFrame);
        imshow("edges", edges);
        c = waitKey(100); // waits 100ms and advances to the next frame
        if (c == 27) {
            // press ESC to exit
            printf("ESC pressed - capture finished\n");
            break; //ESC pressed
        };
    }
}

void testSnap() {
    chdir(projectPath.c_str());

    VideoCapture cap(0); // open the default camera (i.e. the built in web cam)
    if (!cap.isOpened()) // opening the video device failed
    {
        printf("Cannot open video capture device.\n");
        return;
    }

    Mat frame;
    char numberStr[256];
    char fileName[256];

    // video resolution
    Size capS = Size((int) cap.get(CAP_PROP_FRAME_WIDTH),
                     (int) cap.get(CAP_PROP_FRAME_HEIGHT));

    // Display window
    const char *WIN_SRC = "Src"; //window for the source frame
    namedWindow(WIN_SRC, WINDOW_AUTOSIZE);
    moveWindow(WIN_SRC, 0, 0);

    const char *WIN_DST = "Snapped"; //window for showing the snapped frame
    namedWindow(WIN_DST, WINDOW_AUTOSIZE);
    moveWindow(WIN_DST, capS.width + 10, 0);

    char c;
    int frameNum = -1;
    int frameCount = 0;

    // Create Images directory if it doesn't exist
    struct stat st = {0};
    if (stat("Images", &st) == -1) {
        mkdir("Images", 0700);
    }

    for (;;) {
        cap >> frame; // get a new frame from camera
        if (frame.empty()) {
            printf("End of the video file\n");
            break;
        }

        ++frameNum;

        imshow(WIN_SRC, frame);

        c = waitKey(10); // waits a key press to advance to the next frame
        if (c == 27) {
            // press ESC to exit
            printf("ESC pressed - capture finished");
            break; //ESC pressed
        }
        if (c == 115) {
            //'s' pressed - snap the image to a file
            frameCount++;
            fileName[0] = '\0';
            sprintf(numberStr, "%d", frameCount);
            strcat(fileName, "Images/A");
            strcat(fileName, numberStr);
            strcat(fileName, ".bmp");
            bool bSuccess = imwrite(fileName, frame);
            if (!bSuccess) {
                printf("Error writing the snapped image\n");
            } else
                imshow(WIN_DST, frame);
        }
    }
}

void MyCallBackFunc(int event, int x, int y, int flags, void *param) {
    Mat *src = (Mat *) param;
    if (event == EVENT_LBUTTONDOWN) {
        printf("Pos(x,y): %d,%d  Color(RGB): %d,%d,%d\n",
               x, y,
               (int) (*src).at<Vec3b>(y, x)[2],
               (int) (*src).at<Vec3b>(y, x)[1],
               (int) (*src).at<Vec3b>(y, x)[0]);
    }
}

void testMouseClick() {
    Mat src;
    // Read image from file
    std::string fname;
    while (openFileDlg(fname)) {
        src = imread(fname);
        //Create a window
        namedWindow("My Window", 1);

        //set the callback function for any mouse event
        setMouseCallback("My Window", MyCallBackFunc, &src);

        //show the image
        imshow("My Window", src);

        // Wait until user press some key
        waitKey(0);
    }
}


void showHistogram(const std::string &name, int *hist, const int hist_cols, const int hist_height) {
    Mat imgHist(hist_height, hist_cols, CV_8UC3, CV_RGB(255, 255, 255)); // constructs a white image

    //computes histogram maximum
    int max_hist = 0;
    for (int i = 0; i < hist_cols; i++)
        if (hist[i] > max_hist)
            max_hist = hist[i];
    double scale = 1.0;
    scale = (double) hist_height / max_hist;
    int baseline = hist_height - 1;

    for (int x = 0; x < hist_cols; x++) {
        Point p1 = Point(x, baseline);
        Point p2 = Point(x, baseline - cvRound(hist[x] * scale));
        line(imgHist, p1, p2, CV_RGB(255, 0, 255)); // histogram bins colored in magenta
    }

    imshow(name, imgHist);
}

// lab 1

// Implement a function which changes the gray levels of an image by an additive factor.
void changeGrayLevelUsingAdditiveFactor() {
    unsigned int factor = 0;
    printf("\nFactor: ");
    scanf("%d", &factor);

    Mat img = imread("Images/saturn.bmp", 0);

    imshow("original", img);

    for (int i = 0; i < img.rows; i++) {
        for (int j = 0; j < img.cols; j++) {
            int val = img.at<unsigned char>(i, j) + factor;
            img.at<unsigned char>(i, j) = val > 255 ? 255 : val;
        }
    }

    imshow("new_image", img);
    waitKey(0);
}

// Implement a function which changes the gray levels of an image by a multiplicative factor.
void changeGrayLevelUsingMultiplicativeFactor() {
    unsigned int factor = 0;
    printf("\nFactor: ");
    scanf("%d", &factor);

    Mat img = imread("Images/saturn.bmp", 0);

    imshow("original", img);

    for (int i = 0; i < img.rows; i++) {
        for (int j = 0; j < img.cols; j++) {
            int val = img.at<unsigned char>(i, j) * factor;
            img.at<unsigned char>(i, j) = val > 255 ? 255 : val;
        }
    }

    imshow("new_image", img);
    imwrite("MyImages/imgEx4.bmp", img);
    waitKey(0);
}

//Create a color image of dimension 256 x 256. Divide it into 4 squares and color the squares from top to bottom, left to right as : white, red, green, yellow.
void createImageWithFourColors() {
    Mat img(256, 256, CV_8UC3);

    int mid = 128;

    for (int i = 0; i < img.rows; i++) {
        for (int j = 0; j < img.cols; j++) {
            Vec3b color{0, 0, 0};

            if (i < mid && j < mid) {
                color = {255, 255, 255};
            } else if (i < mid && j >= mid) {
                color = {0, 0, 255};
            } else if (i >= mid && j < mid) {
                color = {0, 255, 0};
            } else if (i >= mid && j >= mid) {
                color = {0, 255, 255};
            }

            img.at<Vec3b>(i, j) = color;
        }
    }

    imshow("image", img);
    waitKey(0);
}

//Create a 3x3 float matrix, determine its inverse and print it.

void computeMatrixInverse() {
    printf("Matrix 3x3: ");
    float vals[9]{};

    for (int i = 0; i < 9; i++) {
        scanf("%f", &vals[i]);
    }

    Mat M(3, 3, CV_32FC1, vals);

    M = M.inv();

    printf("\n");
    for (int i = 0; i < M.rows; i++) {
        for (int j = 0; j < M.cols; j++) {
            printf("%f ", M.at<float>(i, j));
        }
        printf("\n");
    }

    char c;
    scanf("%c", &c);
    scanf("%c", &c);
}

int main() {
    cv::utils::logging::setLogLevel(cv::utils::logging::LOG_LEVEL_FATAL);

    // Get current directory
    char cwd[1024];
    if (getcwd(cwd, sizeof(cwd)) != NULL) {
        projectPath = std::string(cwd);
    }

    int op;
    do {
        system("clear");
        destroyAllWindows();
        printf("Menu:\n");
        printf(" 1 - Open image\n");
        printf(" 2 - Open BMP images from folder\n");
        printf(" 3 - Image negative\n");
        printf(" 4 - Image negative (fast)\n");
        printf(" 5 - BGR->Gray\n");
        printf(" 6 - BGR->Gray (fast, save result to disk) \n");
        printf(" 7 - BGR->HSV\n");
        printf(" 8 - Resize image\n");
        printf(" 9 - Canny edge detection\n");
        printf(" 10 - Edges in a video sequence\n");
        printf(" 11 - Snap frame from live video\n");
        printf(" 12 - Mouse callback demo\n");

        //lab 1
        printf(" 13 - Change the gray level of image using additive factor\n");
        printf(" 14 - Change the gray level of image using multiplicative factor\n");
        printf(
            " 15 - Create a color image of dimension 256 x 256. Divide it into 4 squares and color the squares from top to bottom, left to right as : white, red, green, yellow.\n");
        printf(" 16 - Create a 3x3 float matrix, determine its inverse and print it.\n");


        printf(" 0 - Exit\n\n");
        printf("Option: ");
        scanf("%d", &op);
        switch (op) {
            case 1:
                testOpenImage();
                break;
            case 2:
                testOpenImagesFld();
                break;
            case 3:
                testNegativeImage();
                break;
            case 4:
                testNegativeImageFast();
                break;
            case 5:
                testColor2Gray();
                break;
            case 6:
                testImageOpenAndSave();
                break;
            case 7:
                testBGR2HSV();
                break;
            case 8:
                testResize();
                break;
            case 9:
                testCanny();
                break;
            case 10:
                testVideoSequence();
                break;
            case 11:
                testSnap();
                break;
            case 12:
                testMouseClick();
                break;
            //lab 1
            case 13:
                changeGrayLevelUsingAdditiveFactor();
                break;
            case 14:
                changeGrayLevelUsingMultiplicativeFactor();
                break;
            case 15:
                createImageWithFourColors();
                break;
            case 16:
                computeMatrixInverse();
                break;
        }
    } while (op != 0);
    return 0;
}
