module trijam12.math.vector;

import std.uni : toUpper;
import std.string : format;

struct Vector2(T) if (is(T: real)) {
    private:
        T x, y;

        mixin template GetterSetter(string var) {
            mixin("T get%s() const { return %s; }".format(var.toUpper, var));
            mixin("void set%s(T v) {  %s = v; }".format(var.toUpper, var));
        }

    public:
        mixin GetterSetter!"x";
        mixin GetterSetter!"y";

}