# Lynda - Learning React.js (CentOS)
React.js is a JavaScript library designed to make the process of building user interfaces more simple and intuitive. Design basic views for each state in your application, and React will efficiently update and render just the right components when your data changes.

`Eve Porcello`

## 01 What is React.js
### Setting up React Developer Tools

**Chrome Extensions**

`react-detector` `react developer tools`

Open React Developer Tools

`cmd + opt + j`

## 02 Getting Started
### React.js syntax

**Adding React JS Library**

React 0.14.3 (production)
```
<script src="https://fb.me/react-0.14.3.min.js"></script>
<script src="https://fb.me/react-dom-0.14.3.min.js"></script>
```

index.html
```
<!DOCTYPE html>
<html>
  <head>
    <script src="https://fb.me/react-0.14.3.min.js"></script>
    <script src="https://fb.me/react-dom-0.14.3.min.js"></script>
    <title>My First React File</title>
  </head>
  <body>
  <script>
    React.render(React.createElement('div', null, 'Hello World'), document.body);
  </script>
  </body>
</html>
```
