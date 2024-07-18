CXX = g++
CXXFLAGS = -Wall -g -Iinclude -IC:/Libraries/OpenCV-MinGW-Build-OpenCV-4.1.1-x64/include -IC:/Libraries/eigen-3.4.0
LDFLAGS = -LC:/Libraries/OpenCV-MinGW-Build-OpenCV-4.1.1-x64/x64/mingw/lib \
		-llibopencv_calib3d411 \
		-llibopencv_core411 \
		-llibopencv_dnn411 \
		-llibopencv_features2d411 \
		-llibopencv_flann411 \
		-llibopencv_highgui411 \
		-llibopencv_imgcodecs411 \
		-llibopencv_imgproc411 \
		-llibopencv_ml411 \
		-llibopencv_objdetect411 \
		-llibopencv_photo411 \
		-llibopencv_stitching411 \
		-llibopencv_video411 \
		-llibopencv_videoio411

TARGET = myprogram
SRCDIR = src
OBJDIR = obj

SOURCES := $(wildcard $(SRCDIR)/*.cpp) 
OBJECTS := $(patsubst $(SRCDIR)/%.cpp, $(OBJDIR)/%.o, $(SOURCES)) 


$(OBJDIR)/%.o: $(SRCDIR)/%.cpp	
	if not exist $(OBJDIR) mkdir $(OBJDIR)
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $@ $(LDFLAGS)

clean:
	if exist $(OBJDIR) rmdir /s /q $(OBJDIR)
	if exist $(TARGET).exe del $(TARGET).exe