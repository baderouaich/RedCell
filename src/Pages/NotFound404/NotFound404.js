import React from 'react'
import { Link } from 'react-router-dom'

export default function NotFound404() 
{
    const styles = 
    {
        container: {
            display: "flex",
            justifyContent: "center",
            flexDirection: "column",
            textAlign: "center"
        },
        go_home:
        {
            alignSelf: "center",
            margin: "25px"
        },
        not_found_text:
        {
            fontFamily: "SF-Pro-Display-Light"
        }
    };
    return (
        <div style={styles.container}>
            <h1 style={styles.not_found_text}>404 PAGE NOT FOUND! 😞</h1> 
            <div className="divider"></div>
            <div style={styles.go_home}>
                <Link className="waves-effect waves-light btn" to='/'>Go Home</Link>
            </div>
        </div>
      
    );
};
