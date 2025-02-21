import React, { useState } from 'react';
import ReactMarkdown from 'react-markdown'; // Import react-markdown

const CbtAi = () => {
    const [userInput, setUserInput] = useState('');
    const [responses, setResponses] = useState([]);

    const handleInputChange = (e) => {
        setUserInput(e.target.value);
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        const newResponse = { user: userInput };
        // Add the user's message to responses first
        setResponses(prev => [...prev, newResponse]);
        
        // Call the API
        const apiKey = 'YOUR_API_KEY'; // Replace with your actual API key
        const apiUrl = 'http://192.168.213.209:3000/chat'; // Replace with the actual API endpoint

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
            setResponses(prev => [...prev, aiResponse]);
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
                        {res.ai && (
                            <div>
                                <strong>AI:</strong>
                                {/* Render the AI response as formatted markdown */}
                                <ReactMarkdown>{res.ai}</ReactMarkdown>
                            </div>
                        )}
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
