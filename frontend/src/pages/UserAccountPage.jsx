import React from 'react';
import { Link } from 'react-router-dom';
import './UserAccountPage.css'; // Import the CSS file for styling
import profileImage from '../images/profile.jpg'; // Import the profile image

const UserAccountPage = () => {
  return (
    <div className="account-container">
      <h2>Welcome to Your Account</h2>
      <div className="account-info">
        <img src={profileImage} alt="Profile" className="profile-image" />
        <p>Username: JohnDoe</p>
        <p>Email: johndoe@example.com</p>
        <p>Membership: Premium</p>
      </div>
      <div className="navigation">
        <Link to="/mynfts" className="nav-link">My NFTs</Link>
        <Link to="/mysoldnfts" className="nav-link">My Sold NFTs</Link>
        <Link to="/marketplace" className="nav-link">Marketplace</Link>
        <Link to="/createnft" className="nav-link">Create NFT</Link>
      </div>
    </div>
  );
};

export default UserAccountPage;
