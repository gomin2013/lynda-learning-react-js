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
