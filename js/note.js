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
React.render(<Board count={10}/>, document.body);
