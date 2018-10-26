all: function.js arrayfunction.js functionmodule.js

function.js: function.cpp
	emcc function.cpp -o function.js -s SINGLE_FILE=1 -s EXPORTED_FUNCTIONS='["_int_sqrt"]' -s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]'

functionmodule.js: function.cpp
	emcc function.cpp -o functionmodule.js -s SINGLE_FILE=1 -s EXPORTED_FUNCTIONS='["_int_sqrt"]' -s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]' -s MODULARIZE=1 -s 'EXPORT_NAME="functionModule"'

arrayfunction.js: arrayfunction.cpp
	emcc arrayfunction.cpp -o arrayfunction.js -s SINGLE_FILE=1 -s EXPORTED_FUNCTIONS='["_addToVector"]' -s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]'

clean:
	rm function.js functionmodule.js arrayfunction.js
