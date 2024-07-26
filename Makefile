.PHONY: all run
CC := clang
CXX := clang++
LD := clang++
AR := ar
RANLIB :=
CFLAGS := -g -O0 -Wall -MP -MMD -DGL_SILENCE_DEPRECATION
CXXFLAGS := $(CFLAGS) -std=c++20 -xc++
SRCDIR := ./src
OBJDIR := ./obj
BINDIR := ./bin
INCLUDE := -I/opt/homebrew/include/ -I/usr/include/ -I/usr/local/include/ -I./vendor/ -I./vendor/glad/include/
INCLUDE := $(INCLUDE) -I./vendor/spdlog/include -I/opt/homebrew/Cellar/glm/1.0.1/include/
LIBS := -lm
DEFINES := 
TARGET := ./bin/GameApp
FRAMEWORKS  := -framework OpenGL -framework Cocoa -framework IOKit -framework CoreVideo
OPENGLLIB := -L/opt/homebrew/Cellar/glew/2.2.0_1/lib -L/opt/homebrew/Cellar/glfw/3.4/lib
LDFLAGS     := -L/usr/lib -L/usr/local/lib $(OPENGLLIB) -lGLEW.2.2 -lglfw.3.4

SRC := pch.cpp Application.cpp MyApp.cpp Log.cpp WindowsWindow.cpp WindowsInput.cpp Window.cpp
SRC := $(SRC) Renderer.cpp OpenGLRendererAPI.cpp RendererAPI.cpp
SRC := $(SRC) RenderCommand.cpp
SRC := $(SRC) OpenGLContext.cpp GraphicsContext.cpp
SRC := $(SRC) Layer.cpp LayerStack.cpp

OBJS  := $(addprefix $(OBJDIR)/, $(SRC:.cpp=.o)) 
OBJS  := $(OBJS) $(OBJDIR)/gl.o 
DEPS  := $(addprefix $(OBJDIR)/, $(SRC:.cpp=.d))

all: $(TARGET)

run:
	$(TARGET)

$(TARGET): $(OBJS)
	@echo '$$'LDFLAGS is $(LDFLAGS)
	mkdir -p $(@D)
	$(LD) $^ -o $@ $(LDFLAGS) $(FRAMEWORKS)

$(OBJDIR)/gl.o: ./vendor/glad/src/gl.c
	mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) $(INCLUDE) -o $@ -c $<

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	# @[ -d $(OBJDIR) ]
	mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) $(INCLUDE) -o $@ -c $<

debug : $(TARGET)
	@echo "debug $(TARGET)"
	lldb $(TARGET)

clean :
	rm -rf $(BINDIR) $(OBJDIR)

-include $(DEPS)
