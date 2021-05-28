import React, { Component } from 'react';
import './Dashboard.scss';
import BloodDonationRequestSummary from './../../Components/BloodDonationRequestSummary/BloodDonationRequest'


class Dashboard extends Component
{
    render()
    {
        return (
           <div className="dashboard container">
               <div className="row">
                  {/* https://materializecss.com/grid.html */}
                   
                    <div className="col s12 m6"> {/* take half of the screen */}
                      {/*  <BloodDonationRequestList />
                      
                      todo: search input
                      cards donneurs
                      */ }
                    </div>

                    <div className="col s12 m5"> {/* take half of the screen m5 leave small gap to the right */}
                         {/*<Notifications />*/}
                    </div>

               </div>
           </div>
        );
    };
};
export default Dashboard;