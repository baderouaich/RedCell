import React from 'react'
import './Header.scss'
import Logo from '../../Resources/Images/Logo.png'
const Header = props => 
{
    return (
        <header className="header">
            <img src={Logo} />
        </header>
    )
};

export default Header;