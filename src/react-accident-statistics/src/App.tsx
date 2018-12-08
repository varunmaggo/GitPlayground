import * as React from 'react';
// TODO: Restructure this properly
import './styles/css/App.css';
import './styles/css/accident-statistics-list.css';

import Hello from './components/hello';
import AccidentStatisticsList from './components/accident-statistics-list'
import logo from './logo.svg';

class App extends React.Component {
  public render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Welcome to React</h1>
        </header>
        <p className="App-intro">
          To get started, edit <code>src/App.tsx</code> and save to reload.
        </p>
        <Hello name="Vincent" enthusiasmLevel={10} />
        <AccidentStatisticsList severityOption="Fatal" fromDate="Dec 1, 2017, 12:00:00 AM" toDate="Dec 31, 2017, 11:59:00 PM" orderByOption="DateDescending" showJson={true}/>        
        <AccidentStatisticsList severityOption="Fatal" fromDate="Dec 1, 2017, 12:00:00 AM" toDate="Dec 31, 2017, 11:59:00 PM" orderByOption="DateAscending"/>        
        <AccidentStatisticsList severityOption="Fatal" fromDate="Dec 1, 2017, 12:00:00 AM" toDate="Dec 31, 2017, 11:59:00 PM" orderByOption="LocationAscending"/>        
        <AccidentStatisticsList severityOption="Fatal" fromDate="Dec 1, 2017, 12:00:00 AM" toDate="Dec 31, 2017, 11:59:00 PM" orderByOption="LocationDescending"/>        
        <AccidentStatisticsList severityOption="Serious" fromDate="Dec 24, 2017, 12:00:00 AM" toDate="Dec 31, 2017, 11:59:00 PM"/>        
      </div>
    );
  }
}

export default App;
