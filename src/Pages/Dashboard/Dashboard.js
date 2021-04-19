import React, { Component } from 'react';
import './Dashboard.scss';
import BloodDonationRequestSummary from './../../Components/BloodDonationRequestSummary/BloodDonationRequest'


//trivia not for my project, just to keep up
const Notifications = () => 
{
    return (
        <div>
            Notifications
        </div>
    );
};
//trivia not for my project, just to keep up
const BloodDonationRequestList = () => 
{


    return (
        <div className="project-list section">
            <div className="card z-depth-0 project-summary">
                <BloodDonationRequestSummary />
                <BloodDonationRequestSummary />
                <BloodDonationRequestSummary />

            </div>
        </div>
    );
};



class Dashboard extends Component
{
    render()
    {
        return (
           <div className="dashboard container">
               <div className="row">
                  {/* https://materializecss.com/grid.html */}
                   
                    <div className="col s12 m6"> {/* take half of the screen */}
                        <BloodDonationRequestList />
                    </div>

                    <div className="col s12 m5"> {/* take half of the screen m5 leave small gap to the right */}
                        <Notifications />
                    </div>

               </div>
           </div>
        );
    };
};
export default Dashboard;