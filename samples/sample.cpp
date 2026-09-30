// C++ sample
/* block comment */
#include <iostream>
#include <vector>
#include "sample.hpp"

namespace demo {

template <typename T>
class Stack final {
public:
    explicit Stack(int capacity) : capacity_(capacity) {}
    virtual ~Stack() = default;

    void push(const T &value) {
        if (items_.size() >= static_cast<size_t>(capacity_))
            throw std::runtime_error("full");
        items_.push_back(value);
    }

private:
    int capacity_;
    std::vector<T> items_;
};

} // namespace demo

int main() {
    auto *stack = new demo::Stack<double>(0x10);
    bool ok = stack != nullptr;
    try {
        stack->push(3.14f);
    } catch (const std::exception &err) {
        std::cout << "error: " << err.what() << '\n';
    }
    delete stack;
    return ok ? 0 : 1;
}
