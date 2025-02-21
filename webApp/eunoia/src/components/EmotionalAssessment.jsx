import React, { useState } from 'react';

const EmotionalAssessment = () => {
    const [responses, setResponses] = useState({});
    const [submitted, setSubmitted] = useState(false);
    const [score, setScore] = useState(0);

    const questions = [
        "How often do you feel sad or down?",
        "Do you have trouble sleeping?",
        "How often do you feel anxious?",
        "Do you find it hard to concentrate?",
        "How often do you feel overwhelmed?"
    ];

    const handleChange = (index, value) => {
        setResponses({
            ...responses,
            [index]: value
        });
    };

    const calculateScore = () => {
        let totalScore = 0;
        Object.values(responses).forEach(response => {
            if (response === "Always") totalScore += 4;
            else if (response === "Often") totalScore += 3;
            else if (response === "Sometimes") totalScore += 2;
            else if (response === "Never") totalScore += 1;
        });
        return totalScore;
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        const calculatedScore = calculateScore();
        setScore(calculatedScore);
        setSubmitted(true);
    
        // Retrieve the username from local storage
        const username = localStorage.getItem('username');
    
        // Store the score in the backend
        const response = await fetch('http://localhost:5000/api/save-score', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ score: calculatedScore, username }), // Ensure calculatedScore is sent
        });
    
        if (response.ok) {
            console.log('Score saved successfully');
        } else {
            console.error('Failed to save score');
        }
    };

    return (
        <div>
            <h2>Emotional Assessment</h2>
            {submitted ? (
                <div>
                    <h3>Thank you for your responses!</h3>
                    <p>Your Emotional Quotient Score: {score}</p>
                </div>
            ) : (
                <form onSubmit={handleSubmit}>
                    {questions.map((question, index) => (
                        <div key={index}>
                            <label>
                                {question}
                                <select onChange={(e) => handleChange(index, e.target.value)}>
                                    <option value="">Select</option>
                                    <option value="Never">Never</option>
                                    <option value="Sometimes">Sometimes</option>
                                    <option value="Often">Often</option>
                                    <option value="Always">Always</option>
                                </select>
                            </label>
                        </div>
                    ))}
                    <button type="submit">Submit</button>
                </form>
            )}
        </div>
    );
};

export default EmotionalAssessment;