# -*- coding: utf-8 -*-

# https://github.com/Akkiesoft/mikutter_suddenly_death をパクらせていただいた

Plugin.create :mikutter_steve_jobs do
	command(:steve_jobs,
		name: 'スティーブ・ジョブズ',
		condition: lambda{ |opt| true },
		visible: true,
		role: :postbox
	) do |opt|
		begin     
            message = Plugin[:gtk].widgetof(opt.widget).widget_post.buffer.text
            str = message + "\n\n" + "-　スティーブ・ジョブズ　-"

			# スティーブ・ジョブズになる
			if UserConfig[:steve_jobs_immediate] then
				Post.primary_service.update(:message => str)
				Plugin[:gtk].widgetof(opt.widget).widget_post.buffer.text = ""
			else
				Plugin[:gtk].widgetof(opt.widget).widget_post.buffer.text = str
			end
		end
	end

	settings "スティーブ・ジョブズ" do
		boolean('すぐに投稿する', :steve_jobs_immediate)
	end
end
