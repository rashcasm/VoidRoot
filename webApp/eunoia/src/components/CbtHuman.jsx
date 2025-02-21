// import React, { useEffect, useRef, useState } from 'react';

// const counselors = [
//     { id: 1, name: "Counselor 1", description: "Specializes in anxiety and depression.", specialties: ["Anxiety", "Depression"] },
//     { id: 2, name: "Counselor 2", description: "Expert in cognitive behavioral therapy.", specialties: ["CBT", "Stress Management"] },
//     { id: 3, name: "Counselor 3", description: "Focuses on family therapy and relationships.", specialties: ["Family Therapy", "Relationships"] },
//     { id: 4, name: "Counselor 4", description: "Experienced in trauma and PTSD.", specialties: ["Trauma", "PTSD"] },
//     { id: 5, name: "Counselor 5", description: "Works with children and adolescents.", specialties: ["Child Therapy", "Adolescent Issues"] },
//     { id: 6, name: "Counselor 6", description: "Offers mindfulness and holistic approaches.", specialties: ["Mindfulness", "Holistic Therapy"] },
//     { id: 7, name: "Counselor 7", description: "Specializes in addiction and recovery.", specialties: ["Addiction", "Recovery"] },
//     { id: 8, name: "Counselor 8", description: "Expert in grief and loss counseling.", specialties: ["Grief", "Loss"] },
//     { id: 9, name: "Counselor 9", description: "Focuses on workplace stress and burnout.", specialties: ["Workplace Stress", "Burnout"] },
//     { id: 10, name: "Counselor 10", description: "Experienced in couples therapy.", specialties: ["Couples Therapy", "Communication"] },
// ];

// const CbtHuman = () => {
//     const [selectedCounselor, setSelectedCounselor] = useState(null);
//     const [isConnecting, setIsConnecting] = useState(false);
//     const localVideoRef = useRef(null);
//     const remoteVideoRef = useRef(null);
//     const peerConnectionRef = useRef(null);
//     const localStreamRef = useRef(null);

//     const startVideo = async () => {
//         try {
//             localStreamRef.current = await navigator.mediaDevices.getUserMedia({ video: true });
//             localVideoRef.current.srcObject = localStreamRef.current;

//             peerConnectionRef.current = new RTCPeerConnection();
//             localStreamRef.current.getTracks().forEach(track => {
//                 peerConnectionRef.current.addTrack(track, localStreamRef.current);
//             });

//             peerConnectionRef.current.ontrack = (event) => {
//                 remoteVideoRef.current.srcObject = event.streams[0];
//             };

//             const offer = await peerConnectionRef.current.createOffer();
//             await peerConnectionRef.current.setLocalDescription(offer);

//             console.log("Offer sent to counselor:", offer);
//         } catch (error) {
//             console.error("Error accessing media devices.", error);
//         }
//     };

//     const handleCounselorSelection = (counselor) => {
//         setSelectedCounselor(counselor);
//         setIsConnecting(true);

//         setTimeout(() => {
//             setIsConnecting(false);
//             startVideo();
//         }, 5000);
//     };

//     return (
//         <div>
//             <h2>Cognitive Behavioral Therapy with a Counselor</h2>
//             {!selectedCounselor ? (
//                 <div>
//                     <h3>Select a Counselor</h3>
//                     <ul>
//                         {counselors.map(counselor => (
//                             <li key={counselor.id}>
//                                 <button onClick={() => handleCounselorSelection(counselor)}>
//                                     {counselor.name}
//                                 </button>
//                                 <p>{counselor.description}</p>
//                                 <p>Specialties: {counselor.specialties.join(", ")}</p>
//                             </li>
//                         ))}
//                     </ul>
//                 </div>
//             ) : (
//                 <div>
//                     {isConnecting ? (
//                         <h3>Connecting...</h3>
//                     ) : (
//                         <>
//                             <h3>Your Video</h3>
//                             <video ref={localVideoRef} autoPlay playsInline style={{ width: '45%' }} />
//                             <h3>{selectedCounselor.name}'s Video</h3>
//                             <video ref={remoteVideoRef} autoPlay playsInline style={{ width: '45%' }} />
//                         </>
//                     )}
//                 </div>
//             )}
//         </div>
//     );
// };

// export default CbtHuman;

import React, { useEffect, useRef, useState } from 'react';

const counselors = [
    { id: 1, name: "Counselor 1", description: "Specializes in anxiety and depression.", specialties: ["Anxiety", "Depression"] },
    { id: 2, name: "Counselor 2", description: "Expert in cognitive behavioral therapy.", specialties: ["CBT", "Stress Management"] },
    { id: 3, name: "Counselor 3", description: "Focuses on family therapy and relationships.", specialties: ["Family Therapy", "Relationships"] },
    { id: 4, name: "Counselor 4", description: "Experienced in trauma and PTSD.", specialties: ["Trauma", "PTSD"] },
    { id: 5, name: "Counselor 5", description: "Works with children and adolescents.", specialties: ["Child Therapy", "Adolescent Issues"] },
    { id: 6, name: "Counselor 6", description: "Offers mindfulness and holistic approaches.", specialties: ["Mindfulness", "Holistic Therapy"] },
    { id: 7, name: "Counselor 7", description: "Specializes in addiction and recovery.", specialties: ["Addiction", "Recovery"] },
    { id: 8, name: "Counselor 8", description: "Expert in grief and loss counseling.", specialties: ["Grief", "Loss"] },
    { id: 9, name: "Counselor 9", description: "Focuses on workplace stress and burnout.", specialties: ["Workplace Stress", "Burnout"] },
    { id: 10, name: "Counselor 10", description: "Experienced in couples therapy.", specialties: ["Couples Therapy", "Communication"] },
];

const CbtHuman = () => {
    const [selectedCounselor, setSelectedCounselor] = useState(null);
    const [isConnecting, setIsConnecting] = useState(false);
    const localVideoRef = useRef(null);
    const remoteVideoRef = useRef(null);
    const peerConnectionRef = useRef(null);
    const localStreamRef = useRef(null);

    const startVideo = async () => {
        try {
            localStreamRef.current = await navigator.mediaDevices.getUserMedia({ video: true });
            localVideoRef.current.srcObject = localStreamRef.current;

            peerConnectionRef.current = new RTCPeerConnection();
            localStreamRef.current.getTracks().forEach(track => {
                peerConnectionRef.current.addTrack(track, localStreamRef.current);
            });

            peerConnectionRef.current.ontrack = (event) => {
                remoteVideoRef.current.srcObject = event.streams[0];
            };

            const offer = await peerConnectionRef.current.createOffer();
            await peerConnectionRef.current.setLocalDescription(offer);

            console.log("Offer sent to counselor:", offer);
        } catch (error) {
            console.error("Error accessing media devices.", error);
        }
    };

    const handleCounselorSelection = (counselor) => {
        setSelectedCounselor(counselor);
        setIsConnecting(true);

        setTimeout(() => {
            setIsConnecting(false);
            startVideo();
        }, 5000);
    };

    return (
        <div>
            <h2>Cognitive Behavioral Therapy with a Counselor</h2>
            {!selectedCounselor ? (
                <div>
                    <h3>Select a Counselor</h3>
                    <ul>
                        {counselors.map(counselor => (
                            <li key={counselor.id}>
                                <button onClick={() => handleCounselorSelection(counselor)}>
                                    {counselor.name}
                                </button>
                                <p>{counselor.description}</p>
                                <p>Specialties: {counselor.specialties.join(", ")}</p>
                            </li>
                        ))}
                    </ul>
                </div>
            ) : (
                <div>
                    {isConnecting ? (
                        <h3>Connecting...</h3>
                    ) : (
                        <>
                            <h3>Your Video</h3>
                            <video ref={localVideoRef} autoPlay playsInline style={{ width: '45%' }} />
                            <h3>{selectedCounselor.name}'s Video</h3>
                            <video ref={remoteVideoRef} autoPlay playsInline style={{ width: '45%' }} />
                        </>
                    )}
                </div>
            )}
        </div>
    );
};

export default CbtHuman;