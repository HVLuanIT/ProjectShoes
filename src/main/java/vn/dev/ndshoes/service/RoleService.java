package vn.dev.ndshoes.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import vn.dev.ndshoes.model.Role;

@Service
public class RoleService extends BaseService<Role> {
	@Override
	public Class<Role> clazz(){
		return Role.class;
	}
	public List<Role> findAllActive(){
		return super.executeNativeSql("Select * from tbl_role where status = 1");
	}
	@Transactional
	public void deleteRoleById(int id) {
		super.deleteById(id);
	}
	@Transactional
	public void inactiveRole(Role role) {
		super.saveOrUpdate(role);
	}
	public Role getRoleByName(String name){
		String sql = "Select * from tbl_role where name = '" + name + "'";
		List<Role> roles = super.executeNativeSql(sql);
		if(roles.size() > 0) {
			return roles.get(0);
		}else {
			return new Role();
		}
	}
	public Role getRoleById(int roleId) {
		String sql = "SELECT * FROM tbl_role WHERE id = '" + roleId + "'";
		List<Role> roles = super.executeNativeSql(sql);
		if (roles.size() > 0) {
			return roles.get(0);
		}
		else {
			return new Role();
		}
	}
}
