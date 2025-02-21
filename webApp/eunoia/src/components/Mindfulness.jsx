import React from 'react';

const mindfulnessExercises = [
    {
        title: "Guided Meditation",
        description: "A short guided meditation to help you relax and focus.",
        videoUrl: "https://www.youtube.com/watch?v=yLHhITyZrwc",
        videoId: "yLHhITyZrwc"
    },
    {
        title: "Breathing Exercises",
        description: "Learn how to manage stress with these breathing techniques.",
        videoUrl: "https://www.youtube.com/watch?v=NppktbNymbY",
        videoId: "NppktbNymbY"
    },
    {
        title: "Mindfulness Walk",
        description: "A mindfulness walk to connect with nature and your surroundings.",
        videoUrl: "https://www.youtube.com/watch?v=maCdzhtGgGU",
        videoId: "maCdzhtGgGU"
    },
    // Add more exercises as needed
];

const Mindfulness = () => {
    return (
        <div>
            <h2>Mindfulness Exercises</h2>
            {mindfulnessExercises.map((exercise, index) => (
                <div key={index} style={{ marginBottom: '20px' }}>
                    <h3>{exercise.title}</h3>
                    <img 
                        src={`https://img.youtube.com/vi/${exercise.videoId}/hqdefault.jpg`} 
                        alt={exercise.title} 
                        style={{ width: '20%', height: 'auto' }} 
                    />
                    <p>{exercise.description}</p>
                    <a href={exercise.videoUrl} target="_blank" rel="noopener noreferrer">
                        Watch Video
                    </a>
                </div>
            ))}
            <div>
                <h3>Blog Section</h3>
                <p>
                    Mindfulness is the practice of being present in the moment and fully engaging with your thoughts and feelings without judgment.
                    It can help reduce stress, improve focus, and enhance overall well-being. Explore our exercises to incorporate mindfulness into your daily routine.
                </p>
            </div>
        </div>
    );
};

export default Mindfulness;