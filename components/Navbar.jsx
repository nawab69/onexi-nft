import Link from "next/link";

const Navbar = () => {
  return (
    <nav className="border-b p-6">
      <p className="text-4xl font-bold">OneXI</p>
      <div className="flex mt-4">
        <Link href="/">
          <a className="mr-4 text-pink-500">Home</a>
        </Link>
        <Link href="/create-item">
          <a className="mr-6 text-pink-500">Mint and Sell</a>
        </Link>
        <Link href="/my-assets">
          <a className="mr-6 text-pink-500">My NFTs</a>
        </Link>
        <Link href="/creator-dashboard">
          <a className="mr-6 text-pink-500">Dashboard</a>
        </Link>
      </div>
    </nav>
  );
};

export default Navbar;
