import React from 'react'
import './Footer.scss'

const Footer = props => 
{
    return (
        <footer className="footer">
           <p>RedCell Copyright {new Date().getFullYear()}</p>
        </footer>
    )
};

export default Footer;