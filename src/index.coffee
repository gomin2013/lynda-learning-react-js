import {createElement as ele} from 'react'
import {render} from 'react-dom'
import {Board} from './components/Board.coffee'
import './stylesheets/style.scss'
import 'jquery-ui/ui/widgets/draggable'

render ele(Board, { count: 20 }), document.getElementById('page')
