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
```html
<script src="https://fb.me/react-0.14.3.min.js"></script>
<script src="https://fb.me/react-dom-0.14.3.min.js"></script>
```

index.html
```html
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

### Introducing Babel

**cdnjs**

The best FOSS CDN for web related libraries to speed up your websites!
```
https://cdnjs.com/libraries/babel-core
```

**babel-core**

A compiler for writing next generation JavaScript
```
https://unpkg.com/@babel/standalone/babel.min.js
```

index.html
```html
<!DOCTYPE html>
<html>
<head>
  <script src="https://fb.me/react-0.14.3.min.js"></script>
  <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
  <title>My First React File</title>
</head>
<body>
<script type="text/babel">
  var HelloWorld = React.createClass({
    render: function() {
      return (
        <div>
          <h1>Hello world</h1>
          <p>This is some test</p>
        </div>
      );
    }
  });
  React.render(<HelloWorld />, document.body);
</script>
</body>
</html>
```

### Babel on NodeJS

**Setting up NodeJS**

install NodeJS
```
sudo yum -y install nodejs
```

install NodeJS (macOS)
```
brew install node
```

Node JS Version
```
node -v
▶ v6.14.3
```
**Setting up Babel**

Install Babel CLI
```
sudo npm install babel-cli -g
npm list -g --depth=0
```

.babelrc
```json
{
  "presets": ["latest", "react", "stage-0"]
}
```

Install Babel preset
```
npm install babel-preset-latest babel-preset-react babel-preset-stage-0 --save-dev
npm list --depth=0
```

**Using Babel to compile JSX**

src/helloworld.js
```javascript
var HelloWorld = React.createClass({
  render: function() {
    return <div>
        <h1>Hello World</h1>
        <p>This is some text</p>
      </div>;
  }
});

React.render(<HelloWorld />, document.body);
```

Compile Directories
```
babel src --out-dir build
▶ src/helloworld.js -> build/helloworld.js
```

build/helloworld.js
```javascript
"use strict";

var HelloWorld = React.createClass({
  displayName: "HelloWorld",

  render: function render() {
    return React.createElement(
      "div",
      null,
      React.createElement(
        "h1",
        null,
        "Hello World"
      ),
      React.createElement(
        "p",
        null,
        "This is some text"
      )
    );
  }
});

React.render(React.createElement(HelloWorld, null), document.body);
```
index.html
```html
<!DOCTYPE html>
<html>
<head>
  <script src="https://fb.me/react-0.14.3.min.js"></script>
  <title>My First React File</title>
</head>
<body>
<script src="build/helloworld.js"></script>
</body>
</html>
```
