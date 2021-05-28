import React from 'react'
import './Navbar.scss'
import { Link } from 'react-router-dom'
import SignedInLinks from './../../Pages/Authentication/SingedInLinks';
import SignedOutLinks from './../../Pages/Authentication/SignedOutLinks';

import Logo from './../../Resources/Images/Logo.png';

// Navigation bar or Header
// className="materialize css class"
const Navbar = () => 
{
    return (
        // for fixing navbar <div className="navbar-fixed"> 
            <nav className="nav-wrapper grey darken-3">
                <div className="container">
                    {/* Logo, on click send to / home page */}
                    <Link to='/' className="brand-logo left">
                        <img className="logo" src={Logo} alt="RedCell"/>
                    </Link>
                    {/* Signed in links */}
                    <SignedInLinks />
                    {/* Signed out links */}
                    <SignedOutLinks />
                </div>
            </nav>
        // </div>

    )
};

export default Navbar;
