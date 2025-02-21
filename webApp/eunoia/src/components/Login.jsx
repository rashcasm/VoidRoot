import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

const Login = () => {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [message, setMessage] = useState('');
    const [isRegistering, setIsRegistering] = useState(false);
    const navigate = useNavigate();

    const handleSubmit = async (e) => {
        e.preventDefault();
        const response = await fetch(isRegistering ? 'http://localhost:5000/api/register' : 'http://localhost:5000/api/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ username, password }),
        });
        const data = await response.text();
        if (response.ok) {
            console.log(isRegistering ? 'Registration successful:' : 'Login successful:', data);
            setMessage(isRegistering ? 'Registration successful!' : 'Login successful!');
            
            // Store the username in local storage
            localStorage.setItem('username', username);

            // Redirect to homepage after 2 seconds
            setTimeout(() => {
                navigate('/home');
            }, 2000);
        } else {
            console.error(isRegistering ? 'Registration failed:' : 'Login failed:', data);
            setMessage(isRegistering ? 'Registration failed: ' + data : 'Login failed: ' + data);
        }
    };

    return (
        <div>
            <h2>{isRegistering ? 'Register' : 'Login'}</h2>
            <form onSubmit={handleSubmit}>
                <input
                    type="text"
                    placeholder="Username"
                    value={username}
                    onChange={(e) => setUsername(e.target.value)}
                    required
                />
                <input
                    type="password"
                    placeholder="Password"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    required
                />
                <button type="submit">{isRegistering ? 'Register' : 'Login'}</button>
            </form>
            {message && <p>{message}</p>}
            <p>
                {isRegistering ? 'Already have an account? ' : "Don't have an account? "}
                <button onClick={() => setIsRegistering(!isRegistering)}>
                    {isRegistering ? 'Login' : 'Register'}
                </button>
            </p>
        </div>
    );
};

export default Login;