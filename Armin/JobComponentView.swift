import SwiftUI

struct JobComponentView: View {
    let job: Job

    var body: some View {
        HStack {
            Image("CompanyLogo")
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(32)

            VStack(alignment: .leading) {
                Text(job.companyName)
                    .font(.headline)
                Text("Job Category")
                    .foregroundColor(.black.opacity(0.6))
                    .font(.caption2)
                Text(job.description)
                    .font(.body)
                Text("Views: \(job.views)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()

            Link(destination: URL(string: "https://www.linkedin.com/jobs/")!) {
                HStack {
                    Text("Linked In")
                    Image(systemName: "safari")
                }
            }
            .padding(.trailing, 25)
        }
    }
}

#Preview {
    JobComponentView(job: Job(id: 1, companyName: "Acme Corp", description: "Job Description", views: 50))
}
