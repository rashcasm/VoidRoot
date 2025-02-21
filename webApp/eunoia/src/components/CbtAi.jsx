import React, { useState } from 'react';

const CbtAi = () => {
    const [userInput, setUserInput] = useState('');
    const [responses, setResponses] = useState([]);

    const handleInputChange = (e) => {
        setUserInput(e.target.value);
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        const newResponse = { user: userInput };
        setResponses([...responses, newResponse]);
        
        // Call the API
        const apiKey = 'YOUR_API_KEY'; // Replace with your actual API key
        const apiUrl = 'https://api.example.com/chat'; // Replace with the actual API endpoint

        try {
            const response = await fetch(apiUrl, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${apiKey}`,
                },
                body: JSON.stringify({ prompt: userInput }),
            });

            const data = await response.json();
            const aiResponse = { ai: data.response }; // Adjust based on the API's response structure
            setResponses([...responses, newResponse, aiResponse]);
        } catch (error) {
            console.error('Error:', error);
        }

        setUserInput('');
    };

    return (
        <div>
            <h2>Cognitive Behavioral Therapy with AI</h2>
            <div>
                {responses.map((res, index) => (
                    <div key={index}>
                        {res.user && <p><strong>You:</strong> {res.user}</p>}
                        {res.ai && <p><strong>AI:</strong> {res.ai}</p>}
                    </div>
                ))}
            </div>
            <form onSubmit={handleSubmit}>
                <input
                    type="text"
                    value={userInput}
                    onChange={handleInputChange}
                    placeholder="Enter your thoughts..."
                />
                <button type="submit">Send</button>
            </form>
        </div>
    );
};

export default CbtAi;