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

## 03 React Components
### Creating a React Component

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
  var MyComponent = React.createClass({
    render: function () {
      return <div>My Component</div>;
    }
  });
  React.render(<div>
    <MyComponent />
    <MyComponent />
    <MyComponent />
  </div>, document.body);
</script>
</body>
</html>
```

### UsingProps

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
  var MyComponent = React.createClass({
    render: function () {
      return <div>
        <h1>{this.props.text}</h1>
        <p>{this.props.children}</p>
      </div>;
    }
  });
  React.render(<div>
    <MyComponent text="Hello World">This is a hello.</MyComponent>
    <MyComponent text="How are You?">This is a how are you.</MyComponent>
    <MyComponent text="Goodbye">This is a goodbye.</MyComponent>
  </div>, document.body);
</script>
</body>
</html>
```

### HandlingEvents

js/note.js
```javascript
var Note = React.createClass({
  edit: function () {
    alert('editing note');
  },
  remove: function () {
    alert('removeing note');
  },
  render: function () {
    return (
      <div className="note">
        <p>{this.props.children}</p>
        <span>
          <button onClick={this.edit} className="btn btn-primary glyphicon glyphicon-pencil"/>
          <button onClick={this.remove} className="btn btn-danger glyphicon glyphicon-trash"/>
        </span>
      </div>
    );
  }
});
React.render(<Note>Hello World</Note>, document.body);
```

index.html
```html
<!DOCTYPE html>
<html>
<head>
  <!-- jQuery, jQuery.ui -->
  <link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.min.css" rel="stylesheet" type="text/css" />
  <script src="https://code.jquery.com/jquery.min.js"></script>
  <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

  <!-- Bootstrap -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

  <!-- React -->
  <script src="https://fb.me/react-0.14.3.min.js"></script>
  <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>

  <!--Custom Styles -->
  <link href="css/style.css" rel="stylesheet" type="text/css" />
  <title>React Bulletin Board</title>
</head>
<body>
<script src="js/note.js" type="text/babel"></script>
</body>
</html>
```

### UsingState

js/checkbox.js
```javascript
var Checkbox = React.createClass({
  getInitialState: function () {
    return {checked: true}
  },
  handleCheck: function () {
    this.setState({checked: !this.state.checked})
  },
  render: function () {
    var msg = this.state.checked ? "checked" : "unchecked";
    return (
      <div>
        <input type="checkbox" onChange={this.handleCheck} defaultChecked={this.state.checked} />
        <p>This box is {msg}.</p>
      </div>
    );
  }
});
React.render(<Checkbox />, document.body);
```

index.html
```html
<!DOCTYPE html>
<html>
<head>
  <!-- jQuery, jQuery.ui -->
  <link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.min.css" rel="stylesheet" type="text/css" />
  <script src="https://code.jquery.com/jquery.min.js"></script>
  <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

  <!-- Bootstrap -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

  <!-- React -->
  <script src="https://fb.me/react-0.14.3.min.js"></script>
  <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>

  <!--Custom Styles -->
  <link href="css/style.css" rel="stylesheet" type="text/css" />
  <title>React Bulletin Board</title>
</head>
<body>
<script src="js/checkbox.js" type="text/babel"></script>
</body>
</html>
```

### AddingState

js/note.js
```javascript
var Note = React.createClass({
  getInitialState: function() {
    return {editing: false}
  },
  edit: function() {
    this.setState({editing: true});
  },
  save: function() {
    this.setState({editing: false});
  },
  remove: function() {
    alert('removeing note');
  },
  renderDisplay: function() {
    return (
      <div className="note">
        <p>{this.props.children}</p>
        <span>
          <button onClick={this.edit} className="btn btn-primary glyphicon glyphicon-pencil"/>
          <button onClick={this.remove} className="btn btn-danger glyphicon glyphicon-trash"/>
        </span>
      </div>
    );
  },
  renderForm: function() {
    return (
      <div className="note">
        <textarea defaultValue={this.props.children} className="form-control"></textarea>
        <button onClick={this.save} className="btn btn-success btn-sm glyphicon glyphicon-floppy-disk"/>
      </div>
    );
  },
  render: function() {
    return this.state.editing ? this.renderForm() : this.renderDisplay();
  }
});
React.render(<Note>Hello World</Note>, document.body);
```

index.html
```html
<!DOCTYPE html>
<html>
<head>
  <!-- jQuery, jQuery.ui -->
  <link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.min.css" rel="stylesheet" type="text/css" />
  <script src="https://code.jquery.com/jquery.min.js"></script>
  <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

  <!-- Bootstrap -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

  <!-- React -->
  <script src="https://fb.me/react-0.14.3.min.js"></script>
  <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>

  <!--Custom Styles -->
  <link href="css/style.css" rel="stylesheet" type="text/css" />
  <title>React Bulletin Board</title>
</head>
<body>
<script src="js/note.js" type="text/babel"></script>
</body>
</html>
```

## 04 ParentChild Relationships
### Refs

js/note.js
```javascript
var Note = React.createClass({
  getInitialState: function() {
    return {editing: false}
  },
  edit: function() {
    this.setState({editing: true});
  },
  save: function() {
    var val = this.refs.newText.getDOMNode().value;
    alert("TODO: Save note value '" + val + "'");
    this.setState({editing: false});
  },
  remove: function() {
    alert('removeing note');
  },
  renderDisplay: function() {
    return (
      <div className="note">
        <p>{this.props.children}</p>
        <span>
          <button onClick={this.edit} className="btn btn-primary glyphicon glyphicon-pencil"/>
          <button onClick={this.remove} className="btn btn-danger glyphicon glyphicon-trash"/>
        </span>
      </div>
    );
  },
  renderForm: function() {
    return (
      <div className="note">
        <textarea ref="newText" defaultValue={this.props.children} className="form-control"></textarea>
        <button onClick={this.save} className="btn btn-success btn-sm glyphicon glyphicon-floppy-disk"/>
      </div>
    );
  },
  render: function() {
    return this.state.editing ? this.renderForm() : this.renderDisplay();
  }
});
React.render(<Note>Hello World</Note>, document.body);
```

index.html
```html
<!DOCTYPE html>
<html>
<head>
  <!-- jQuery, jQuery.ui -->
  <link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.min.css" rel="stylesheet" type="text/css" />
  <script src="https://code.jquery.com/jquery.min.js"></script>
  <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

  <!-- Bootstrap -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

  <!-- React -->
  <script src="https://fb.me/react-0.14.3.min.js"></script>
  <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>

  <!--Custom Styles -->
  <link href="css/style.css" rel="stylesheet" type="text/css" />
  <title>React Bulletin Board</title>
</head>
<body>
<script src="js/note.js" type="text/babel"></script>
</body>
</html>
```

### PropTypes

js/note.js
```javascript
var Board = React.createClass({
  propTypes: {
    count: function(props, propName) {
      if (typeof props[propName] !== "number") {
        return new Error("The count property must be a number");
      }
      if (props[propName] > 100) {
        return new Error("Creating " + props[propName] + " notes is ridiculous");
      }
    }
  },
  render: function() {
    return <div className="board">{this.props.count}</div>
  }
});
React.render(<Note>Hello World</Note>, document.body);
```

index.html
```html
<!DOCTYPE html>
<html>
<head>
  <!-- jQuery, jQuery.ui -->
  <link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.min.css" rel="stylesheet" type="text/css" />
  <script src="https://code.jquery.com/jquery.min.js"></script>
  <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

  <!-- Bootstrap -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

  <!-- React -->
  <script src="https://fb.me/react-0.14.3.min.js"></script>
  <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>

  <!--Custom Styles -->
  <link href="css/style.css" rel="stylesheet" type="text/css" />
  <title>React Bulletin Board</title>
</head>
<body>
<script src="js/note.js" type="text/babel"></script>
</body>
</html>
```

### ChildElements

js/note.js
```javascript
var Note = React.createClass({
  getInitialState: function() {
    return {editing: false}
  },
  edit: function() {
    this.setState({editing: true});
  },
  save: function() {
    var val = this.refs.newText.getDOMNode().value;
    alert("TODO: Save note value '" + val + "'");
    this.setState({editing: false});
  },
  remove: function() {
    alert('removeing note');
  },
  renderDisplay: function() {
    return (
      <div className="note">
        <p>{this.props.children}</p>
        <span>
          <button onClick={this.edit} className="btn btn-primary glyphicon glyphicon-pencil"/>
          <button onClick={this.remove} className="btn btn-danger glyphicon glyphicon-trash"/>
        </span>
      </div>
    );
  },
  renderForm: function() {
    return (
      <div className="note">
        <textarea ref="newText" defaultValue={this.props.children} className="form-control"></textarea>
        <button onClick={this.save} className="btn btn-success btn-sm glyphicon glyphicon-floppy-disk"/>
      </div>
    );
  },
  render: function() {
    return this.state.editing ? this.renderForm() : this.renderDisplay();
  }
});

var Board = React.createClass({
  propTypes: {
    count: function(props, propName) {
      if (typeof props[propName] !== "number") {
        return new Error("The count property must be a number");
      }
      if (props[propName] > 100) {
        return new Error("Creating " + props[propName] + " notes is ridiculous");
      }
    }
  },
  getInitialState: function() {
    return {
      notes: [
        'Call Bill',
        'Email Lisa',
        'Make dentist appt',
        'Send Proposal'
      ]
    }
  },
  render: function() {
    return (
      <div className="board">
        {this.state.notes.map(function(note, i){
          return (<Note key={i}>{note}</Note>);
        })}
      </div>
    );
  }
});
React.render(<Board count={10}/>, document.body);
```

index.html
```html
<!DOCTYPE html>
<html>
<head>
  <!-- jQuery, jQuery.ui -->
  <link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.min.css" rel="stylesheet" type="text/css" />
  <script src="https://code.jquery.com/jquery.min.js"></script>
  <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

  <!-- Bootstrap -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

  <!-- React -->
  <script src="https://fb.me/react-0.14.3.min.js"></script>
  <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>

  <!--Custom Styles -->
  <link href="css/style.css" rel="stylesheet" type="text/css" />
  <title>React Bulletin Board</title>
</head>
<body>
<script src="js/note.js" type="text/babel"></script>
</body>
</html>
```

### Updating RemovingNotes

js/note.js
```javascript
var Note = React.createClass({
  getInitialState: function() {
    return {editing: false}
  },
  edit: function() {
    this.setState({editing: true});
  },
  save: function() {
    this.props.onChange(this.refs.newText.getDOMNode().value, this.props.index);
    this.setState({editing: false});
  },
  remove: function() {
    this.props.onRemove(this.props.index);
  },
  renderDisplay: function() {
    return (
      <div className="note">
        <p>{this.props.children}</p>
        <span>
          <button onClick={this.edit} className="btn btn-primary glyphicon glyphicon-pencil"/>
          <button onClick={this.remove} className="btn btn-danger glyphicon glyphicon-trash"/>
        </span>
      </div>
    );
  },
  renderForm: function() {
    return (
      <div className="note">
        <textarea ref="newText" defaultValue={this.props.children} className="form-control"></textarea>
        <button onClick={this.save} className="btn btn-success btn-sm glyphicon glyphicon-floppy-disk"/>
      </div>
    );
  },
  render: function() {
    return this.state.editing ? this.renderForm() : this.renderDisplay();
  }
});

var Board = React.createClass({
  propTypes: {
    count: function(props, propName) {
      if (typeof props[propName] !== "number") {
        return new Error("The count property must be a number");
      }
      if (props[propName] > 100) {
        return new Error("Creating " + props[propName] + " notes is ridiculous");
      }
    }
  },
  getInitialState: function() {
    return {
      notes: [
        'Call Bill',
        'Email Lisa',
        'Make dentist appt',
        'Send Proposal'
      ]
    }
  },
  update: function(newText, i) {
    var arr = this.state.notes;
    arr[i] = newText;
    this.setState({notes:arr});
  },
  remove: function(i) {
    var arr = this.state.notes;
    arr.splice(i, 1);
    this.setState({notes:arr});
  },
  eachNote: function(note, i) {
    return (
      <Note key={i}
            index={i}
            onChange={this.update}
            onRemove={this.remove}
      >{note}</Note>
    );
  },
  render: function() {
    return (<div className="board">
        {this.state.notes.map(this.eachNote)}
      </div>
    );
  }
});
React.render(<Board count={10}/>, document.body);
```

index.html
```html
<!DOCTYPE html>
<html>
<head>
  <!-- jQuery, jQuery.ui -->
  <link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.min.css" rel="stylesheet" type="text/css" />
  <script src="https://code.jquery.com/jquery.min.js"></script>
  <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

  <!-- Bootstrap -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

  <!-- React -->
  <script src="https://fb.me/react-0.14.3.min.js"></script>
  <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>

  <!--Custom Styles -->
  <link href="css/style.css" rel="stylesheet" type="text/css" />
  <title>React Bulletin Board</title>
</head>
<body>
<script src="js/note.js" type="text/babel"></script>
</body>
</html>
```

### AddingNotes

js/note.js
```javascript
var Note = React.createClass({
  getInitialState: function() {
    return {editing: false}
  },
  edit: function() {
    this.setState({editing: true});
  },
  save: function() {
    this.props.onChange(this.refs.newText.getDOMNode().value, this.props.index);
    this.setState({editing: false});
  },
  remove: function() {
    this.props.onRemove(this.props.index);
  },
  renderDisplay: function() {
    return (
      <div className="note">
        <p>{this.props.children}</p>
        <span>
          <button onClick={this.edit} className="btn btn-primary glyphicon glyphicon-pencil"/>
          <button onClick={this.remove} className="btn btn-danger glyphicon glyphicon-trash"/>
        </span>
      </div>
    );
  },
  renderForm: function() {
    return (
      <div className="note">
        <textarea ref="newText" defaultValue={this.props.children} className="form-control"></textarea>
        <button onClick={this.save} className="btn btn-success btn-sm glyphicon glyphicon-floppy-disk"/>
      </div>
    );
  },
  render: function() {
    return this.state.editing ? this.renderForm() : this.renderDisplay();
  }
});

var Board = React.createClass({
  propTypes: {
    count: function(props, propName) {
      if (typeof props[propName] !== "number") {
        return new Error("The count property must be a number");
      }
      if (props[propName] > 100) {
        return new Error("Creating " + props[propName] + " notes is ridiculous");
      }
    }
  },
  getInitialState: function() {
    return {
      notes: []
    }
  },
  add: function(text) {
    var arr = this.state.notes;
    arr.push(text);
    this.setState({notes: arr});
  },
  update: function(newText, i) {
    var arr = this.state.notes;
    arr[i] = newText;
    this.setState({notes: arr});
  },
  remove: function(i) {
    var arr = this.state.notes;
    arr.splice(i, 1);
    this.setState({notes: arr});
  },
  eachNote: function(note, i) {
    return (
      <Note key={i}
            index={i}
            onChange={this.update}
            onRemove={this.remove}
      >{note}</Note>
    );
  },
  render: function() {
    return (<div className="board">
        {this.state.notes.map(this.eachNote)}
        <button className="btn btn-sm btn-success glyphicon glyphicon-plus"
                onClick={this.add.bind(null, "New Note")}/>
      </div>
    );
  }
});
React.render(<Board count={10}/>, document.body);
```

index.html
```html
<!DOCTYPE html>
<html>
<head>
  <!-- jQuery, jQuery.ui -->
  <link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.min.css" rel="stylesheet" type="text/css" />
  <script src="https://code.jquery.com/jquery.min.js"></script>
  <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

  <!-- Bootstrap -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

  <!-- React -->
  <script src="https://fb.me/react-0.14.3.min.js"></script>
  <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>

  <!--Custom Styles -->
  <link href="css/style.css" rel="stylesheet" type="text/css" />
  <title>React Bulletin Board</title>
</head>
<body>
<script src="js/note.js" type="text/babel"></script>
</body>
</html>
```

### Keys

js/note.js
```javascript
var Note = React.createClass({
  getInitialState: function() {
    return {editing: false}
  },
  componentWillMount: function() {
    this.style = {
      right: this.radomBetween(0, window.innerWidth - 150) + 'px',
      top: this.radomBetween(0, window.innerHeight - 150) + 'px',
      transform: 'rotate(' + this.radomBetween(-15, 50) + 'deg)'
    };
  },
  radomBetween: function(min, max) {
    return (min + Math.ceil(Math.random() * max));
  },
  edit: function() {
    this.setState({editing: true});
  },
  save: function() {
    this.props.onChange(this.refs.newText.getDOMNode().value, this.props.index);
    this.setState({editing: false});
  },
  remove: function() {
    this.props.onRemove(this.props.index);
  },
  renderDisplay: function() {
    return (
      <div className="note" style={this.style}>
        <p>{this.props.children}</p>
        <span>
          <button onClick={this.edit} className="btn btn-primary glyphicon glyphicon-pencil"/>
          <button onClick={this.remove} className="btn btn-danger glyphicon glyphicon-trash"/>
        </span>
      </div>
    );
  },
  renderForm: function() {
    return (
      <div className="note" style={this.style}>
        <textarea ref="newText" defaultValue={this.props.children} className="form-control"></textarea>
        <button onClick={this.save} className="btn btn-success btn-sm glyphicon glyphicon-floppy-disk"/>
      </div>
    );
  },
  render: function() {
    return this.state.editing ? this.renderForm() : this.renderDisplay();
  }
});

var Board = React.createClass({
  propTypes: {
    count: function(props, propName) {
      if (typeof props[propName] !== "number") {
        return new Error("The count property must be a number");
      }
      if (props[propName] > 100) {
        return new Error("Creating " + props[propName] + " notes is ridiculous");
      }
    }
  },
  getInitialState: function() {
    return {
      notes: []
    }
  },
  nextId: function() {
    this.uniqueId = this.uniqueId || 0;
    this.uniqueId++;
  },
  add: function(text) {
    var arr = this.state.notes;
    arr.push({
      id: this.nextId(),
      note: text
    });
    this.setState({notes: arr});
  },
  update: function(newText, i) {
    var arr = this.state.notes;
    arr[i].note = newText;
    this.setState({notes: arr});
  },
  remove: function(i) {
    var arr = this.state.notes;
    arr.splice(i, 1);
    this.setState({notes: arr});
  },
  eachNote: function(note, i) {
    return (
      <Note key={note.id}
            index={i}
            onChange={this.update}
            onRemove={this.remove}
      >{note.note}</Note>
    );
  },
  render: function() {
    return (<div className="board">
        {this.state.notes.map(this.eachNote)}
        <button className="btn btn-sm btn-success glyphicon glyphicon-plus"
                onClick={this.add.bind(null, "New Note")}/>
      </div>
    );
  }
});
React.render(<Board count={10}/>, document.body);
```

css/style.css
```css
div.note {
  height: 150px;
  width: 150px;
  background-color: yellow;
  margin: 2px 0;
  position: absolute;
  cursor: -webkit-grab;
  -webkit-box-shadow: 5px 5px 15px 0 rgba(0, 0, 0, .2);
  box-shadow: 5px 5px 15px 0 rgba(0, 0, 0, .2);
}
```

index.html
```html
<!DOCTYPE html>
<html>
<head>
  <!-- jQuery, jQuery.ui -->
  <link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.min.css" rel="stylesheet" type="text/css" />
  <script src="https://code.jquery.com/jquery.min.js"></script>
  <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

  <!-- Bootstrap -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

  <!-- React -->
  <script src="https://fb.me/react-0.14.3.min.js"></script>
  <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>

  <!--Custom Styles -->
  <link href="css/style.css" rel="stylesheet" type="text/css" />
  <title>React Bulletin Board</title>
</head>
<body>
<script src="js/note.js" type="text/babel"></script>
</body>
</html>
```

## 05 Component Life Cycle
### Mounting

css/style.css
```css
div {
  background-color: blue;
  height: 200px;
  width: 200px;
}
```

index.html
```html
<!DOCTYPE html>
<html>
<head>
  <title>Component Lifecycle</title>
  <script crossorigin src="https://unpkg.com/react@16/umd/react.development.js"></script>
  <script crossorigin src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"></script>
  <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
  <link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<script type="text/babel">
  class Box extends React.Component {
    componentWillMount() {
      alert("component is about to mount");
    }

    componentDidMount() {
      alert('component has mounted');
    }

    handleClick() {
      ReactDOM.unmountComponentAtNode(document.body);
      alert('component is unmounted');
    }

    render() {
      return <div onClick={this.handleClick}></div>;
    }
  }
  ReactDOM.render(<Box />, document.body);
</script>
</body>
</html>
```

### Setting Props

index.html
```html
<!DOCTYPE html>
<html>
<head>
  <title>Component Lifecycle</title>
  <script crossorigin src="https://unpkg.com/react@16/umd/react.development.js"></script>
  <script crossorigin src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"></script>
  <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
</head>
<body>
<script type="text/babel">
  class Box extends React.Component {
    constructor(props) {
      super(props);
      this.state = {
        backgroundColor: "red",
        height: 200,
        width: 200
      };
    }

    render() {
      return (
        <div style={this.state}></div>
      );
    }
  }

  ReactDOM.render(<Box />, document.body);
</script>
</body>
</html>
```

### Updating Components

index.html
```html
<!DOCTYPE html>
<html>
<head>
  <title>Component Lifecycle</title>
  <script crossorigin src="https://unpkg.com/react@16/umd/react.production.min.js"></script>
  <script crossorigin src="https://unpkg.com/react-dom@16/umd/react-dom.production.min.js"></script>
  <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
  <link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<script type="text/babel">
  class Box extends React.Component {
    static defaultProps = {
      colorIndex: -1
    };

    constructor(props) {
      super(props);

      this.state = {
        backgroundColor: "Blue"
      };

      this.setNextColor = this.setNextColor.bind(this);
    }

    setNextColor() {
      var colors = this.props.colors.split(', ');
      this.props.colorIndex = (this.props.colorIndex + 1) % colors.length;
      this.setState({ backgroundColor: colors[this.props.colorIndex] });
    }

    render() {
      return (
        <div style={this.state} onClick={this.setNextColor}>{this.state.backgroundColor}</div>
      );
    }
  }

  ReactDOM.render(<Box colors="Red, DarkMagenta, Salmon, Chartreuse, Blue" />, document.body);
</script>
</body>
</html>
```

### Lifecycle Functions

js/note.js
```javascript
var Note = React.createClass({
    getInitialState: function() {
        return {editing: false}
    },
    componentWillMount: function() {
        this.style = {
            right: this.randomBetween(0, window.innerWidth - 150) + 'px',
            top: this.randomBetween(0, window.innerHeight - 150) + 'px',
            transform: 'rotate(' + this.randomBetween(-15, 15) + 'deg)'
        };
    },
    componentDidMount: function(){
        $(this.getDOMNode()).draggable();
    },
    randomBetween: function(min, max) {
        return (min + Math.ceil(Math.random() * max));
    },
    edit: function() {
        this.setState({editing: true});
    },
    save: function() {
        this.props.onChange(this.refs.newText.getDOMNode().value, this.props.index);
        this.setState({editing: false});
    },
    remove: function() {
        this.props.onRemove(this.props.index);
    },
    renderDisplay: function() {
        return (
            <div className="note"
                style={this.style}>
                <p>{this.props.children}</p>
                <span>
                    <button onClick={this.edit}
                            className="btn btn-primary glyphicon glyphicon-pencil"/>
                    <button onClick={this.remove}
                            className="btn btn-danger glyphicon glyphicon-trash"/>
                </span>
            </div>
            );
    },
    renderForm: function() {
        return (
            <div className="note" style={this.style}>
            <textarea ref="newText" defaultValue={this.props.children} 
            className="form-control"></textarea>
            <button onClick={this.save} className="btn btn-success btn-sm glyphicon glyphicon-floppy-disk" />
            </div>
            )
    },
    render: function() {
        if (this.state.editing) {
            return this.renderForm();
        }
        else {
            return this.renderDisplay();
        }
    }
});

var Board = React.createClass({
    propTypes: {
        count: function(props, propName) {
            if (typeof props[propName] !== "number"){
                return new Error('The count property must be a number');
            }
            if (props[propName] > 100) {
                return new Error("Creating " + props[propName] + " notes is ridiculous");
            }
        }
    },
    getInitialState: function() {
        return {
            notes: []
        };
    },
    nextId: function() {
        this.uniqueId = this.uniqueId || 0;
        return this.uniqueId++;
    },
    componentWillMount: function() {
        var self = this;
        if(this.props.count) {
            $.getJSON("http://baconipsum.com/api/?type=all-meat&sentences=" +
                this.props.count + "&start-with-lorem=1&callback=?", function(results){
                    results[0].split('. ').forEach(function(sentence){
                        self.add(sentence.substring(0,40));
                    });
                });
        }
    },
    add: function(text) {
        var arr = this.state.notes;
        arr.push({
            id: this.nextId(),
            note: text
        });
        this.setState({notes: arr});
    },
    update: function(newText, i) {
        var arr = this.state.notes;
        arr[i].note = newText;
        this.setState({notes:arr});
    },
    remove: function(i) {
        var arr = this.state.notes;
        arr.splice(i, 1);
        this.setState({notes: arr});
    },
    eachNote: function(note, i) {
        return (
                <Note key={note.id}
                    index={i}
                    onChange={this.update}
                    onRemove={this.remove}
                >{note.note}</Note>
            );
    },
    render: function() {
        return (<div className="board">
                    {this.state.notes.map(this.eachNote)}
                    <button className="btn btn-sm btn-success glyphicon glyphicon-plus"
                            onClick={this.add.bind(null, "New Note")}/>
            </div>

        );
    }
});


React.render(<Board count={50}/>, document.getElementById('react-container'));
```

### Convert to webpack + Coffeescript + SCSS + Pug.

Files and directories.
```
lynda-learning-react-js
  ├── package.json
  ├── postcss.config.js
  ├── webpack.config.js
  └── src
      ├── components
      │   ├── Board.coffee
      │   └── Note.coffee
      ├── index.coffee
      ├── index.pug
      └── stylesheets
          ├── fonts.scss
          └── style.scss
```

package.json
```json
{
  "name": "lynda-learning-react",
  "version": "1.0.0",
  "private": true,
  "main": "index.js",
  "scripts": {
    "prestart": "webpack",
    "start": "./node_modules/.bin/webpack-dev-server"
  },
  "devDependencies": {
    "@babel/cli": "^7.2.3",
    "@babel/core": "^7.3.4",
    "@babel/preset-env": "^7.3.4",
    "autoprefixer": "^9.4.7",
    "babel-loader": "^8.0.5",
    "bootstrap": "^4.3.1",
    "coffee-loader": "^0.9.0",
    "coffeescript": "^2.3.2",
    "css-loader": "^2.1.0",
    "cssnano": "^4.1.8",
    "html-webpack-plugin": "^3.2.0",
    "node-sass": "^4.11.0",
    "postcss-loader": "^3.0.0",
    "pug": "^2.0.3",
    "pug-loader": "^2.4.0",
    "react-dom-factories": "^1.0.2",
    "sass-loader": "^7.1.0",
    "style-loader": "^0.23.1",
    "webpack": "^4.29.6",
    "webpack-cli": "^3.2.3",
    "webpack-dev-server": "^3.2.1"
  },
  "dependencies": {
    "jquery": "^3.3.1",
    "jquery-ui": "^1.12.1",
    "popper.js": "^1.14.7",
    "react": "^16.8.4",
    "react-dom": "^16.8.4",
    "react-icons": "^3.5.0"
  }
}
```

postcss.config.js
```javascript
module.exports = {
  plugins: {
    'autoprefixer': {},
    'cssnano': {}
  }
};
```

webpack.config.js
```javascript
const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  mode: "development",
  entry: './src/index.coffee',
  output: {
    path: path.resolve(__dirname, 'docs/assets'),
    publicPath: '/assets/',
    filename: 'bundle.js'
  },
  devServer: {
    inline: true,
    contentBase: './docs',
    port: 3000,
    https: true,
    headers: {
      'Access-Control-Allow-Origin': '*'
    }
  },
  module: {
    rules: [{
      test: /\.pug$/,
      use: ['pug-loader']
    },{
      test: /\.coffee$/,
      use: [
        {
          loader: 'coffee-loader',
          options: {
            transpile: {
              presets: ['@babel/preset-env']
            }
          }
        }
      ]
    },{
      test: /\.scss$/,
      use: ['style-loader', 'css-loader', 'postcss-loader', 'sass-loader']
    }]
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: path.resolve(__dirname, 'src/index.pug'),
      filename: path.resolve(__dirname, 'docs/index.html')
    })
  ]
};
```

src/components/Board.coffee
```coffeescript
import {Component, createElement as ele} from 'react'
import {div, button} from 'react-dom-factories'
import {Note} from './Note.coffee'
import {FaPlus} from 'react-icons/fa'
import $ from 'jquery'

export class Board extends Component

  constructor: (props) ->
    super(props)
    this.state = {
      notes: []
    }

    this.updateNote = this.updateNote.bind(this)
    this.removeNote = this.removeNote.bind(this)

  nextId: ->
    this.uniqueId ||= 0
    this.uniqueId++

  addNote: (text) ->
    this.state.notes.push({ id: this.nextId(), note: text.substring(0, 40) })
    this.setState { notes: this.state.notes }

  updateNote: (newText, i) ->
    this.state.notes[i].note = newText
    this.setState { notes: this.state.notes }

  removeNote: (i) ->
    this.state.notes.splice(i, 1)
    this.setState { notes: this.state.notes }

  componentWillMount: ->
    self = this

    if this.props.count
      $.getJSON "https://baconipsum.com/api/?type=all-meat&sentences=#{this.props.count}&start-with-lorem=1&callback=?"
        .done (results) ->
          results[0].split('. ').forEach (note) ->
            self.addNote(note)

  render: ->
    self = this

    div { className: 'board' },
      this.state.notes.map (note, i) ->
        ele Note, { key: note.id, index: i, onChange: self.updateNote, onRemove: self.removeNote },
          note.note
      button { className: 'btn btn-sm btn-success', onClick: this.addNote.bind(this, 'New Note') },
        FaPlus null

Board.propTypes =
  count: (props, propName) ->
    if typeof props[propName] != 'number'
      new Error('The count property must be a number.')
    if props[propName] > 100
      new Error("Creating #{props[propName]} notes is ridiculous.")
```

src/components/Note.coffee
```coffeescript
import {Component} from 'react'
import {findDOMNode} from 'react-dom'
import {div, p, span, textarea, button} from 'react-dom-factories'
import {FaPen, FaTrashAlt} from 'react-icons/fa'
import {IoIosSave} from 'react-icons/io'
import $ from 'jquery'

randomBetween = (min, max) ->
  min + Math.ceil(Math.random() * max)

export class Note extends Component

  constructor: (props) ->
    super(props)
    this.state = {
      editing: false
    }

    this.edit = this.edit.bind(this)
    this.remove = this.remove.bind(this)

  componentWillMount: ->
    this.style = {
      right: randomBetween(0, window.innerWidth - 150) + 'px'
      top: randomBetween(0, window.innerHeight - 150) + 'px'
      transform: 'rotate(' + randomBetween(-15, 50) + 'deg)'
    }

  componentDidMount: ->
    $(findDOMNode(this)).draggable({ addClasses: false })

  edit: ->
    this.setState { editing: true }

  saveNote: ->
    this.props.onChange($(findDOMNode(this.refs.newText)).val(), this.props.index)
    this.setState { editing: false }

  remove: ->
    this.props.onRemove(this.props.index)

  renderDisplay: ->
    div { className: 'note', style: this.style },
      p null, this.props.children
      span null,
        button { className: 'btn btn-primary', onClick: this.edit },
          FaPen null
        button { className: 'btn btn-danger', onClick: this.remove },
          FaTrashAlt null

  renderForm: ->
    div { className: 'note', style: this.style },
      textarea { className: 'form-control', ref: 'newText', defaultValue: this.props.children }
      button { className: 'btn btn-success btn-sm', onClick: this.saveNote.bind(this) },
        IoIosSave null

  render: ->
    if this.state.editing then this.renderForm()  else this.renderDisplay()
```

src/index.coffee
```coffeescript
import {createElement as ele} from 'react'
import {render} from 'react-dom'
import {Board} from './components/Board.coffee'
import './stylesheets/style.scss'
import 'jquery-ui/ui/widgets/draggable'

render ele(Board, { count: 20 }), document.getElementById('page')
```

src/index.pug
```jade
doctype html
head
  meta(charset='UTF-8')
  title React Bulletin Board
#page
```

Please find [`fonts.scss`](../03b5b0ac99ab91dbd08f71d0f691e92119ac7f75/src/stylesheets/fonts.scss) and [`style.scss`](../03b5b0ac99ab91dbd08f71d0f691e92119ac7f75/src/stylesheets/style.scss)

![Convert to webpack + Coffeescript + SCSS + Pug.](/README/05-05-converted-to-webpack-coffeescript-scss-pug.gif)
