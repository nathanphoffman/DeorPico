// C++ header sample
#pragma once
#include <string>

#define SAMPLE_LIMIT 0x40

namespace demo {

/* An abstract shape */
class Shape {
public:
    virtual ~Shape() noexcept = default;
    virtual double area() const = 0;
    const std::string &name() const { return name_; }

protected:
    explicit Shape(std::string name) : name_(name) {}

private:
    std::string name_;
    mutable bool cached_ = false;
};

template <typename T>
constexpr T square(T value) { return value * value; }

} // namespace demo
