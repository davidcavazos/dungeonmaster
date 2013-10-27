CXX=clang++
CXX_FLAGS=-std=c++11 -Wall -Wextra -Weffc++ -Wfatal-errors -pedantic -O3
CXX_LDFLAGS=

OBJ_DIR=obj
SRC=main.cpp
OBJ=$(SRC:%.cpp=$(OBJ_DIR)/%.o)
BIN=dungeonmaster

all: mkdirs $(SRC) $(BIN)

$(BIN): $(OBJ)
	$(CXX) $(CXX_LDFLAGS) $(OBJ) -o $@

$(OBJ_DIR)/%.o: $(SRC)
	$(CXX) $(CXX_FLAGS) -c $< -o $@

.PHONY: mkdirs
mkdirs:
	mkdir -p $(OBJ_DIR)

.PHONY: clean
clean:
	rm -rf $(OBJ_DIR) *~ $(BIN)
