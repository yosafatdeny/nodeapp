use dbqelas;
select * from users;
show tables;
desc users;
desc kelas;
desc category;
select * from kelas;
select * from category;
select * from cart;
select * from paket;
select * from users;
select * from transaction;
select * from langganan;
select * from konfirmasi;
select * from modul;
select * from belajar;

select c.*, k.kelasName as nama, k.price as harga
	from cart c
    join kelas k
    On c.kelasId = k.idKelas
    where userId = 2;

    
select k.*, c.name as category 
	from kelas k 
    join category c 
    On c.idCategory = k.catId;
    
select t.*, p.durasi, p.harga, u.username as NamaUser
	from transaction t
    join paket p
    on t.paketId = p.idpaket
    join users u
    on t.userId = u.id
    where userId = 1;

select * from transaction where idtransaction=4;

SELECT m.*, k.kelasName as nama 
                        FROM modul m
                        JOIN kelas k
                        on m.idkelas = k.idKelas;
    
insert into belajar values(1,2);

select b.*, u.userName, k.idKelas
	from belajar b
    join  modul m
    on b.idmodal = m.idmodul
    join kelas k
    on k.idKelas = m.idkelas
    join users u
    on b.iduser = u.id
    where k.idKelas = 2 && u.id = 1;
    
select b.*, k.idKelas
	from belajar b
    join  modul m
    on b.idmodal = m.idmodul
    join kelas k
    on k.idKelas = m.idkelas
    where k.idKelas = 2 && b.iduser = 2;
    
    use mysql;
    select * from mysql.user;