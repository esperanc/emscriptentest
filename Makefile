all: function.js arrayfunction.js

function.js: function.cpp
	emcc function.cpp -o function.js -s SINGLE_FILE=1 -s EXPORTED_FUNCTIONS='["_int_sqrt"]' -s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]'

arrayfunction.js: arrayfunction.cpp
	emcc arrayfunction.cpp -o arrayfunction.js -s SINGLE_FILE=1 -s EXPORTED_FUNCTIONS='["_addToVector"]' -s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]'

clean:
	rm function.js
