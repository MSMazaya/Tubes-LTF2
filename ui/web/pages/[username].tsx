import React from 'react'
import { useRouter } from 'next/router'

const UsernamePage = () => {
    const router = useRouter()
    const {username} = router.query;

    return (
        <div>Welcome {username}</div>
    )
}

export default UsernamePage