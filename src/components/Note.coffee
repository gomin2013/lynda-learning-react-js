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
