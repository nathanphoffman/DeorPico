<?php
// PHP sample
/* block comment */
# hash comment
declare(strict_types=1);

namespace App\Samples;

use InvalidArgumentException;

final class Cart
{
    private array $items = [];
    public const LIMIT = 1_000;

    public function add(string $name, float $price = 9.99): static
    {
        if ($price < 0 || count($this->items) >= self::LIMIT) {
            throw new InvalidArgumentException('bad item');
        }
        $this->items[$name] = $price;
        return $this;
    }

    public function total(): float
    {
        return array_sum($this->items);
    }
}

$cart = (new Cart())->add("tea", 3.5)->add('cake');
echo "Total: {$cart->total()}\n";
