package vn.dev.ndshoes.configurer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import vn.dev.ndshoes.service.UserDetailsServiceImpl;

@Configuration
@EnableWebSecurity
public class SecureConfigurer extends WebSecurityConfigurerAdapter{
	@Override
	protected void configure(final HttpSecurity http) throws Exception{
		// Bắt đầu cấu hình
		http.csrf().disable().authorizeRequests()// Bắt các request tu browser
		
		// Cho phep các request, static resource không bị ràng buộc login
		.antMatchers("/frontend/**","/backend/**", "/FileUploads/**", "/login", "/logout").permitAll()
		
		// Các requests kiểu "/admin/**" phải login (xác thực)
//		.antMatchers("/admin/**").authenticated() // step 1+2
		// Các kiểu request kiểu /admin/** phải có role là ADMIN // step
		.antMatchers("/admin/**").hasAnyAuthority("ADMIN")
		
		.and()
		
		// Nếu chưa login(xác thực ) thì redirect đến trang login
		// Với "/login" là một request ( trong LoginController)
		.formLogin().loginPage("/login").loginProcessingUrl("/login_processing_url")
		
//		.defaultSuccessUrl("/admin/home",true)// Login thành công thì đưa tới trang chủ của admin
		.successHandler(new UrlAuthenticationSuccessHandler())
		//Login không thành công
		.failureUrl("/login?login_error = true")
//		.failureUrl("/login?error=true")
		.and()
		// Cấu hình phần logout
		.logout().logoutUrl("/logout").logoutSuccessUrl("/login").invalidateHttpSession(true)
		.deleteCookies("JSESSIONID");
//		
//		.and().rememberMe().key("uniqueAndSecret").tokenValiditySeconds(8600);
	}
	@Autowired
	private UserDetailsServiceImpl userDetailsService;
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception{
		auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder(4));
	}
//	public static void main(String[] args) {
//		System.out.println(new BCryptPasswordEncoder(4).encode("123"));
//	}
}
