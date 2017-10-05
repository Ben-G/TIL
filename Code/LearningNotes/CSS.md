- Keywords new to me:  `calc` `box-shadow`
- Block-Element-Modifier (BEM) naming convention
- http://getbem.com/naming/
- More on naming conventions:
  - http://thesassway.com/advanced/modular-css-naming-conventions
- Elements can be styled together indepenent of their modifier value using this syntax:

```css
[class^="todo-list__item"] {
  cursor: pointer;	
  ...
}
```

- Complex box shadow example (stacked box shadows):

```css
 box-shadow: 0 1px 0 0 #e6e6e6, 0 2px 0 0 white;	
```

- `:focus` attribute for changing style when focused
- `::placeholder` attribute for changing style of placeholder text
- [Use semantic markup](https://html.com/semantic-markup/); example use `fieldset` and `legend`
  - Good for accessibility & when CSS fails to load

Sibling selectors!

```CSS
.filter__radio:checked + [class^="filter__label"] {
  color: #fff;
}
```

- For media queries: recommended to start with mobile friendly; then changing for larger screens as needed.
- Can use react-css-transition-group to drive css based animations from React