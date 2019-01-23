if creator == noone or creator == other
{
	exit;
}

other.hp -= damage;
instance_destroy(other);