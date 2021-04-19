// Navbar links to show signed out users
import React from 'react'
import { NavLink } from 'react-router-dom'

// When a user is signed out, what links u want them to see
const SignedOutLinks = () => 
{
    return (
      <ul className="right">
          <li> <NavLink to="/">Signup</NavLink> </li>
          <li> <NavLink to="/">Login</NavLink> </li>
      </ul>  
    );
};

export default SignedOutLinks;