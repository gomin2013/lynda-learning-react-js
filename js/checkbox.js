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
