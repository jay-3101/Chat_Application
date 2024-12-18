CXX = g++
CXXFLAGS = -std=c++11 -Wall
BINDIR = bin

SRCS_SERVER = src/server.cpp src/sockutil.cpp
SRCS_CLIENT = src/client.cpp src/sockutil.cpp
OBJS_SERVER = $(patsubst src/%.cpp,$(BINDIR)/%.o,$(SRCS_SERVER))
OBJS_CLIENT = $(patsubst src/%.cpp,$(BINDIR)/%.o,$(SRCS_CLIENT))
TARGET_SERVER = $(BINDIR)/server
TARGET_CLIENT = $(BINDIR)/client

all: $(TARGET_SERVER) $(TARGET_CLIENT)

$(TARGET_SERVER): $(OBJS_SERVER) | $(BINDIR)
	$(CXX) $(CXXFLAGS) -o $@ $^

$(TARGET_CLIENT): $(OBJS_CLIENT) | $(BINDIR)
	$(CXX) $(CXXFLAGS) -o $@ $^

$(BINDIR)/%.o: src/%.cpp | $(BINDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(BINDIR):
	mkdir -p $(BINDIR)

clean:
	rm -rf $(BINDIR) $(TARGET_SERVER) $(TARGET_CLIENT)

.PHONY: all clean
