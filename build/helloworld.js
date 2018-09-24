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