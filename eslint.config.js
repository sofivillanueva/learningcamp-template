import js from "@eslint/js";

export default [
  { 
    files: ["app/**/*.js"],
    ...js.configs.recommended,
    ignores: ['app/assets/builds/*'],
    rules: {
      "no-class-assign": 0,
      "no-param-reassign": 0,
      "class-methods-use-this": 0,
      "consistent-return": 0,
      "no-shadow": 0,
      "eqeqeq": 0,
      "array-callback-return": 0,
      "no-console": [
        1,
        {
          "allow": ["warn", "error"]
        }
      ],
      "no-debugger": 1,
      "no-var": 1,
      "no-trailing-spaces": 1,
      "eol-last": 1,
      "no-underscore-dangle": 0,
      "no-alert": 0,
      "no-lone-blocks": 0,
      "jsx-quotes": 1,
      "no-multi-spaces": 1,
      "block-spacing": 1,
      "brace-style": 1,
      "comma-spacing": [
        1,
        {
          "before": false,
          "after": true
        }
      ],
      "comma-style": 1,
      "key-spacing": 1,
      "no-multiple-empty-lines": [
        1,
        {
          "max": 1
        }
      ],
      "arrow-spacing": 1,
      "object-curly-spacing": [1, "always"],
      "space-before-blocks": [1, "always"],
      "keyword-spacing": 1,
      "indent": [
        1,
        2,
        {
          "SwitchCase": 1
        }
      ],
      "max-len": 0,
      "operator-linebreak": 0,
      "object-curly-newline": 0,
      "implicit-arrow-linebreak": 0,
      "prefer-promise-reject-errors": 0
    }
  }
];
