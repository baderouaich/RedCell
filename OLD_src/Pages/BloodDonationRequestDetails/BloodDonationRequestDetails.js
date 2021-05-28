import React from 'react'


// Project details will be treated as BloodDonationRequestDetails
const BloodDonationRequestDetails = (props) => {

    const id = props.match.params.id;
    console.log("BDRD ID is " + id);


    return (
        <div className="container section blood-donation-request-details">
            <div className="card z-depth-0">
                <div className="card-content">
                    <div className="card-title">Blood Donation Request Title {id}</div>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempora, fuga ipsa. Sed totam nesciunt quibusdam itaque, adipisci veniam tempore sint, deleniti maxime eum incidunt error molestiae dicta tenetur ipsum accusantium.</p>
                </div>

                <div className="card-action gret lighten-4 grey-text">
                    <div>Posted by Bader eddine ouaich</div>
                    <div>{new Date().toDateString()}</div>
                </div>
            </div>
        </div>
    );
};

export default BloodDonationRequestDetails;