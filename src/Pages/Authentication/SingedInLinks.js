// Navbar links to show signed in users
import React from 'react'
import { NavLink } from 'react-router-dom'

// When a user is signed in, what links u want them to see
const SignedInLinks = () => 
{
    return (
      <ul className="right">
          <li> <NavLink to="/"></NavLink> </li>
          <li> <NavLink to="/"></NavLink> </li>
          <li> <NavLink to="/">Log Out</NavLink> </li>
          <li> <NavLink to="/" className="btn btn-floating teal lighten-1">BO</NavLink> </li>
      </ul>  
        
    );
};

export default SignedInLinks;