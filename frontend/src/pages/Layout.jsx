import React from 'react';
import { Outlet, Link } from 'react-router-dom';

const Layout = () => {
  return (
    <div>
      <nav>
        <ul>
          <li><Link to="/account">Account</Link></li>
          <li><Link to="/mynfts">My NFTs</Link></li>
          <li><Link to="/mysoldnfts">My Sold NFTs</Link></li>
          <li><Link to="/marketplace">Marketplace</Link></li>
          <li><Link to="/createnft">Create NFT</Link></li>
        </ul>
      </nav>
      <Outlet />
    </div>
  );
};

export default Layout;
