
use dbqelas;
select * from users;
show tables;
desc users;
desc kelas;
desc category;
desc langganan;
select * from kelas;
select * from category;
select * from cart;
select * from paket;
select * from users;
select * from langganan;
select * from transaction;

select username, roleId from users;
select * from roles;
select * from transaction ;

select * from konfirmasi;
select * from modul;
select * from belajar;
select * from kelasku;

select u.username, p.durasi, l.akhirlangganan   
	from users u
    left join langganan l
    on u.id = l.userId
    left join paket p
    on p.idpaket = l.paketId
    where status = 'active' or status is null ;

select m.title as JudulModul,  count(b.modulId) as jumlah
	from belajar b
    join modul m
    on m.idmodul = b.modulId 
    group by modulId;
    
select modulId, count(belajar.modulId) from belajar group by userId;

select title, count(*) from modul where idmodul in(select modulId from belajar); 

select c.*, k.kelasName as nama, k.price as harga
	from cart c
    join kelas k
    On c.kelasId = k.idKelas
    where userId = 2;
    
select * from users where id = 9;

select kk.*, count(m.idmodul) as jumlahModul  
                            from kelasku kk
                            join modul m 
                            on  kk.kelasId = m.idkelas 
                            where userId = 1
                            group by kk.kelasId;
select u.*, r.roleName as role 
	from users u
    join roles r
    on u.roleId = r.id;
    
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
    
insert into belajar values(1,5);
insert into kelasku values(1000,1000);
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
    on b.modulId = m.idmodul
    join kelas k
    on k.idKelas = m.idkelas;
    
select kk.*, count(*) as jmlKelas 
	from modul m
    join kelasku kk
    on kk.kelasId = m.idkelas
    where kk.kelasId = 15;
    
select idkelas, count(idmodul) as jlmModul from modul group by idkelas;
    
select b.* , m.idkelas 
	from belajar b
    join modul m
    on b.modulId = m.idmodul
    where userId =1;
    
select b.userId, count(b.modulId) as modulSelesai, m.idkelas as kelasId
	from belajar b
    join modul m
    on b.modulId = m.idmodul
    where userId = 1
    group by kelasId;

select k.*, c.name as category, count(m.idmodul) as jlmModul 
		from kelas k 
		join category c 
		On c.idCategory = k.catId
        join modul m
        on k.idKelas = m.idkelas
        group by m.idKelas;
    
select kk.*, count(m.idmodul) as jumlahModul  
	from kelasku kk
    join modul m 
    on  kk.kelasId = m.idkelas 
    where userId =1
    group by kk.kelasId;

select k.*, c.name as category, count(m.idmodul) as jlmModul 
                        from kelas k 
                        join category c 
                        On c.idCategory = k.catId
                        join modul m
                        on k.idKelas = m.idkelas
                        where k.idKelas = 15
                        group by m.idKelas;
                        
select l.*, p.durasi  
	from langganan l 
    join paket p 
    on l.paketId = p.idpaket 
    where userId = 7 && status='active';
    
    use mysql;
    select * from mysql.user;