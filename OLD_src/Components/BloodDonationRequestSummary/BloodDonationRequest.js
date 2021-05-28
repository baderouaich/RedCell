import React from 'react'


// ProjectSummary will be treated as BloodDonationRequestSummary
const BloodDonationRequestSummary = () => {
    return (
        <div className="container section blood-donation-request-details">
            <div className="card z-depth-0">
                <div className="card-content">
                    <div className="card-title">Blood Donation Request Title</div>
                    <p>Summurized title</p>
                </div>

                <div className="card-action gret lighten-4 grey-text">
                    <div>Posted by Bader eddine ouaich</div>
                    <div>{new Date().toDateString()}</div>
                </div>
            </div>
        </div>
    );
};

export default BloodDonationRequestSummary;