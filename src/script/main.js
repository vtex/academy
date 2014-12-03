console.log("Nice, you have passed your first test.")





var unique = require('uniq');

var data = [1, 2, 2, 3, 4, 5, 5, 5, 6];

console.log(unique(data));





var React = require('react')

var Hello = React.createClass({

  render: function() {
    return <div>Hello, {this.props.name}!</div>
  }
})

React.render(
  <Hello name="World" />,
  document.getElementById('hello')
)