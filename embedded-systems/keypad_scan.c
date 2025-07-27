#include <stm32f10x.h>

void delay_ms(uint32_t ms) {
  for (volatile uint32_t i = 0; i < ms * 800; i++)
    ;
}

void GPIO_config(void) {
  RCC->APB2ENR |= (1 << 2) | (1 << 3);
  // PA0,1,2 Col Output
  GPIOA->CRL &= ~(0xFFF << 0);
  GPIOA->CRL |= ((3 << 0) | (3 << 4) | (3 << 8));
  // PB0,1,2,3 Row Input
  GPIOB->CRL &= ~(0xFFFF << 0);
  GPIOB->CRL |= (8 << 0) | (8 << 4) | (8 << 8) | (8 << 12);
}

char keypad_scan(void) {
  const char keymap[4][3] = {
      {'1', '2', '3'},
      {'4', '5', '6'},
      {'7', '8', '9'},
      {'*', '0', '#'},
  };
  const uint8_t col_pin[3] = {0, 1, 2};
  const uint8_t row_pin[3] = {0, 1, 2};

  for (uint8_t col = 0; col < 3; col++) {
    GPIOA->ODR |= (1 << 0) | (1 << 1) | (1 << 2);
    GPIOA->ODR &= ~(1 << col_pin[col]);
    for (uint8_t row = 0; row < 4; row++) {
      if (!(GPIOB->IDR & (1 << row_pin[row]))) {
        delay_ms(20);
        while (!(GPIOB->IDR & (1 << row_pin[row])))
          ;
        return keymap[row][col];
      }
    }
  }
  return 0;
}

void RGB_control(char key);

int main(void) {
  GPIO_config();
  while (1) {
    char key = keypad_scan();
    if (key != 0) {
      RGB_control(key);
    }
  }
}
