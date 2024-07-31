#include <iostream>
#include <chrono>
#include <windows.h>
#include <opencv2/opencv.hpp>
#include <Eigen/Dense>
#include "cheader.h"
#include "newheader.hpp"

int main() {
    newFunction();
    cFunction();
    std::cout << "Hello, World!" << std::endl;
    cv::Mat img = cv::imread("still/keiba.png", cv::IMREAD_COLOR);
    if (img.empty()) {
        std::cout << "Could not open or find the images" << std::endl;
        return -1;
    }
    cv::imshow("Display window", img);
    cv::waitKey(0);

    // Eigenを使って行列計算を行う
    Eigen::MatrixXd mat(2, 2);
    mat(0, 0) = 3;
    mat(1, 0) = 2.5;
    mat(0, 1) = -1;
    mat(1, 1) = mat(1, 0) + mat(0, 1);
    std::cout << mat << std::endl;

    return 0;
}