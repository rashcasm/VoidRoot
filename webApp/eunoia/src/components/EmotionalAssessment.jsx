import React, { useState } from 'react';

const EmotionalAssessment = () => {
    const [responses, setResponses] = useState({});
    const [submitted, setSubmitted] = useState(false);

    const questions = [
        "How often do you feel sad or down?",
        "Do you have trouble sleeping?",
        "How often do you feel anxious?",
        "Do you find it hard to concentrate?",
        "How often do you feel overwhelmed?"
    ];

    const mbtiOptions = [
        "ISTJ", "ISFJ", "INFJ", "INTJ",
        "ISTP", "ISFP", "INFP", "INTP",
        "ESTP", "ESFP", "ENFP", "ENTP",
        "ESTJ", "ESFJ", "ENFJ", "ENTJ"
    ];

    const handleChange = (index, value) => {
        setResponses({
            ...responses,
            [index]: value
        });
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        setSubmitted(true);
        console.log("User Responses:", responses);
    };

    return (
        <div>
            <h2>Emotional Assessment</h2>
            {submitted ? (
                <div>
                    <h3>Thank you for your responses!</h3>
                    {/* You can add feedback based on the responses here */}
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
                    <div>
                        <h4>Select your MBTI Type:</h4>
                        {mbtiOptions.map((option, index) => (
                            <label key={index}>
                                <input
                                    type="radio"
                                    name="mbti"
                                    value={option}
                                    onChange={(e) => handleChange('mbti', e.target.value)}
                                />
                                {option}
                            </label>
                        ))}
                    </div>
                    <button type="submit">Submit</button>
                </form>
            )}
        </div>
    );
};

export default EmotionalAssessment;