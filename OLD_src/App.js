import React, { Component } from 'react'
import './App.scss';
import { BrowserRouter, Route, Switch } from 'react-router-dom';

import Navbar from './Components/Navbar/Navbar';
import Dashboard from './Pages/Dashboard/Dashboard';
import NotFound404 from './Pages/NotFound404/NotFound404'
// BD Request Model
import BloodDonationRequestSummary from './Components/BloodDonationRequestSummary/BloodDonationRequest'
// BD Request Page view
import BloodDonationRequestDetails from './Pages/BloodDonationRequestDetails/BloodDonationRequestDetails'
// import Header from './Components/Header/Header'
// import Footer from './Components/Footer/Footer'
// import Welcome from './Pages/Welcome/Welcome';

class App extends Component
{
  render()
  {
    return (
      <BrowserRouter>
        <div className="App">
         
          <Navbar />  {/* header / navigation bar, always on, has signeduplinks & signedout links */}
        
          <Switch> {/*  this make sure only one route is loadedup at a time */}
            
            {/* when a user go to / load in Dashboard component */}
            <Route path='/' component={Dashboard} exact/>
 
            {/* Route for blood donation request */}
            <Route path='/blood-donation-request/:id' component={BloodDonationRequestDetails} />


            {/* default: 404 Error not found */}
            <Route component={NotFound404} />

          </Switch>
        </div>
      </BrowserRouter>
    );
  }
};

export default App;
